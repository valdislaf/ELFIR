#include <efi.h>
#include <efilib.h>

typedef struct {
    UINT8  e_ident[16];
    UINT16 e_type;
    UINT16 e_machine;
    UINT32 e_version;
    UINT64 e_entry;
    UINT64 e_phoff;
    UINT64 e_shoff;
    UINT32 e_flags;
    UINT16 e_ehsize;
    UINT16 e_phentsize;
    UINT16 e_phnum;
    UINT16 e_shentsize;
    UINT16 e_shnum;
    UINT16 e_shstrndx;
} Elf64_Ehdr;

typedef struct {
    UINT32 p_type;
    UINT32 p_flags;
    UINT64 p_offset;
    UINT64 p_vaddr;
    UINT64 p_paddr;
    UINT64 p_filesz;
    UINT64 p_memsz;
    UINT64 p_align;
} Elf64_Phdr;

static BOOLEAN is_elf64(const Elf64_Ehdr *eh) {
    return eh->e_ident[0] == 0x7f &&
           eh->e_ident[1] == 'E' &&
           eh->e_ident[2] == 'L' &&
           eh->e_ident[3] == 'F' &&
           eh->e_ident[4] == 2; /* ELFCLASS64 */
}

static EFI_STATUS read_file(EFI_FILE_HANDLE root, CHAR16 *path, UINT8 **out_buf, UINTN *out_size) {
    EFI_STATUS status;
    EFI_FILE_HANDLE file;
    EFI_FILE_INFO *info;
    UINTN info_size = SIZE_OF_EFI_FILE_INFO + 256;
    UINTN size;
    UINT8 *buf;

    status = uefi_call_wrapper(root->Open, 5, root, &file, path, EFI_FILE_MODE_READ, 0);
    if (EFI_ERROR(status)) {
        return status;
    }

    status = uefi_call_wrapper(gBS->AllocatePool, 3, EfiLoaderData, info_size, (void **)&info);
    if (EFI_ERROR(status)) {
        uefi_call_wrapper(file->Close, 1, file);
        return status;
    }

    status = uefi_call_wrapper(file->GetInfo, 4, file, &gEfiFileInfoGuid, &info_size, info);
    if (EFI_ERROR(status)) {
        uefi_call_wrapper(gBS->FreePool, 1, info);
        uefi_call_wrapper(file->Close, 1, file);
        return status;
    }

    size = (UINTN)info->FileSize;
    uefi_call_wrapper(gBS->FreePool, 1, info);

    status = uefi_call_wrapper(gBS->AllocatePool, 3, EfiLoaderData, size, (void **)&buf);
    if (EFI_ERROR(status)) {
        uefi_call_wrapper(file->Close, 1, file);
        return status;
    }

    status = uefi_call_wrapper(file->Read, 3, file, &size, buf);
    uefi_call_wrapper(file->Close, 1, file);
    if (EFI_ERROR(status)) {
        uefi_call_wrapper(gBS->FreePool, 1, buf);
        return status;
    }

    *out_buf = buf;
    *out_size = size;
    return EFI_SUCCESS;
}

static EFI_STATUS load_kernel_elf(UINT8 *buf, UINTN size, EFI_PHYSICAL_ADDRESS *entry_out) {
    const Elf64_Ehdr *eh;
    const Elf64_Phdr *ph;
    UINTN i;

    if (size < sizeof(Elf64_Ehdr)) {
        Print(L"UEFI: ELF too small (%u)\n", (UINT32)size);
        return EFI_LOAD_ERROR;
    }
    eh = (const Elf64_Ehdr *)buf;
    if (!is_elf64(eh)) {
        Print(L"UEFI: not an ELF64 (magic/class mismatch)\n");
        return EFI_LOAD_ERROR;
    }
    if (eh->e_phoff + (UINTN)eh->e_phnum * sizeof(Elf64_Phdr) > size) {
        Print(L"UEFI: phdrs out of range (off=%u num=%u)\n",
              (UINT32)eh->e_phoff, (UINT32)eh->e_phnum);
        return EFI_LOAD_ERROR;
    }

    Print(L"UEFI: ELF entry=%lx phoff=%u phnum=%u\n",
          (UINT64)eh->e_entry, (UINT32)eh->e_phoff, (UINT32)eh->e_phnum);

    ph = (const Elf64_Phdr *)(buf + eh->e_phoff);
    for (i = 0; i < eh->e_phnum; ++i) {
        const Elf64_Phdr *p = &ph[i];
        EFI_PHYSICAL_ADDRESS addr;
        EFI_PHYSICAL_ADDRESS seg_base;
        EFI_PHYSICAL_ADDRESS seg_end;
        UINTN pages;

        if (p->p_type != 1) { /* PT_LOAD */
            continue;
        }
        if (p->p_memsz == 0) {
            continue;
        }
        addr = (EFI_PHYSICAL_ADDRESS)(p->p_paddr ? p->p_paddr : p->p_vaddr);
        seg_base = addr & ~((EFI_PHYSICAL_ADDRESS)0xFFF);
        seg_end = (addr + p->p_memsz + 0xFFF) & ~((EFI_PHYSICAL_ADDRESS)0xFFF);
        pages = (UINTN)((seg_end - seg_base) >> 12);
        if (addr == 0) {
            Print(L"UEFI: phdr[%u] addr=0\n", (UINT32)i);
            return EFI_LOAD_ERROR;
        }

        Print(L"UEFI: phdr[%u] load addr=%lx filesz=%lx memsz=%lx\n",
              (UINT32)i, (UINT64)addr, (UINT64)p->p_filesz, (UINT64)p->p_memsz);
        EFI_MEMORY_TYPE mem_type = EfiLoaderData;
        if (p->p_flags & 0x1) { /* PF_X */
            mem_type = EfiLoaderCode;
        }
        if (uefi_call_wrapper(gBS->AllocatePages, 4, AllocateAddress, mem_type, pages, &seg_base) != EFI_SUCCESS) {
            Print(L"UEFI: AllocatePages failed for phdr[%u]\n", (UINT32)i);
            return EFI_OUT_OF_RESOURCES;
        }
        uefi_call_wrapper(gBS->SetMem, 3, (void *)(UINTN)addr, (UINTN)p->p_memsz, 0);
        if (p->p_filesz > 0) {
            if (p->p_offset + p->p_filesz > size) {
                Print(L"UEFI: phdr[%u] file range out of bounds\n", (UINT32)i);
                return EFI_LOAD_ERROR;
            }
            uefi_call_wrapper(gBS->CopyMem, 3, (void *)(UINTN)addr, buf + p->p_offset, (UINTN)p->p_filesz);
        }
    }

    *entry_out = (EFI_PHYSICAL_ADDRESS)eh->e_entry;
    return EFI_SUCCESS;
}

static void wait_key(EFI_SYSTEM_TABLE *st) {
    EFI_INPUT_KEY key;
    if (!st || !st->ConIn) {
        return;
    }
    Print(L"Press any key to continue...\n");
    while (uefi_call_wrapper(st->ConIn->ReadKeyStroke, 2, st->ConIn, &key) == EFI_NOT_READY) {
        uefi_call_wrapper(gBS->Stall, 1, 10000);
    }
}

static EFI_HANDLE g_image_handle = NULL;

static void print_status(CHAR16 *label, EFI_STATUS status) {
    Print(L"%s: %r\n", label, status);
}

static UINT64 find_xhci_base(void) {
    EFI_STATUS status;
    EFI_HANDLE *handles = NULL;
    UINTN count = 0;
    UINTN i;

    status = uefi_call_wrapper(gBS->LocateHandleBuffer, 5,
                               ByProtocol, &gEfiPciIoProtocolGuid,
                               NULL, &count, &handles);
    if (EFI_ERROR(status)) {
        print_status(L"UEFI: LocateHandleBuffer(PciIo) failed", status);
        return 0;
    }

    for (i = 0; i < count; ++i) {
        EFI_PCI_IO_PROTOCOL *pci = NULL;
        UINT8 class_code[3];
        UINT32 bar[2];
        UINT64 base;

        status = uefi_call_wrapper(gBS->OpenProtocol, 6,
                                   handles[i],
                                   &gEfiPciIoProtocolGuid,
                                   (void **)&pci,
                                   g_image_handle,
                                   NULL,
                                   EFI_OPEN_PROTOCOL_GET_PROTOCOL);
        if (EFI_ERROR(status) || !pci) {
            continue;
        }

        status = uefi_call_wrapper(pci->Pci.Read, 5, pci,
                                   EfiPciIoWidthUint8, 0x09,
                                   3, class_code);
        if (EFI_ERROR(status)) {
            continue;
        }

        if (class_code[2] != 0x0C || class_code[1] != 0x03 || class_code[0] != 0x30) {
            continue;
        }

        status = uefi_call_wrapper(pci->Pci.Read, 5, pci,
                                   EfiPciIoWidthUint32, 0x10,
                                   2, bar);
        if (EFI_ERROR(status)) {
            continue;
        }

        base = ((UINT64)bar[1] << 32) | (UINT64)bar[0];
        base &= ~((UINT64)0xF);
        if (base != 0) {
            Print(L"UEFI: xHCI MMIO base=%lx\n", base);
            uefi_call_wrapper(gBS->FreePool, 1, handles);
            return base;
        }
    }

    uefi_call_wrapper(gBS->FreePool, 1, handles);
    Print(L"UEFI: xHCI controller not found\n");
    return 0;
}

static EFI_STATUS exit_boot_services(EFI_HANDLE image) {
    EFI_STATUS status;
    UINTN map_size = 0;
    UINTN map_key = 0;
    UINTN desc_size = 0;
    UINT32 desc_version = 0;
    EFI_MEMORY_DESCRIPTOR *map = NULL;

    status = uefi_call_wrapper(gBS->GetMemoryMap, 5, &map_size, map, &map_key, &desc_size, &desc_version);
    if (status != EFI_BUFFER_TOO_SMALL) {
        return status;
    }

    map_size += desc_size * 2;
    status = uefi_call_wrapper(gBS->AllocatePool, 3, EfiLoaderData, map_size, (void **)&map);
    if (EFI_ERROR(status)) {
        return status;
    }

    status = uefi_call_wrapper(gBS->GetMemoryMap, 5, &map_size, map, &map_key, &desc_size, &desc_version);
    if (!EFI_ERROR(status)) {
        status = uefi_call_wrapper(gBS->ExitBootServices, 2, image, map_key);
        if (EFI_ERROR(status)) {
            status = uefi_call_wrapper(gBS->GetMemoryMap, 5, &map_size, map, &map_key, &desc_size, &desc_version);
            if (!EFI_ERROR(status)) {
                status = uefi_call_wrapper(gBS->ExitBootServices, 2, image, map_key);
            }
        }
    }

    uefi_call_wrapper(gBS->FreePool, 1, map);
    return status;
}

static EFI_FILE_HANDLE find_root_for_path(CHAR16 *path) {
    EFI_STATUS status;
    EFI_HANDLE *handles = NULL;
    UINTN count = 0;
    UINTN i;

    status = uefi_call_wrapper(gBS->LocateHandleBuffer, 5, ByProtocol, &gEfiSimpleFileSystemProtocolGuid, NULL, &count, &handles);
    if (EFI_ERROR(status)) {
        print_status(L"UEFI: LocateHandleBuffer(SimpleFileSystem) failed", status);
        return NULL;
    }

    Print(L"UEFI: SimpleFileSystem handles: %u\n", (UINT32)count);
    for (i = 0; i < count; ++i) {
        EFI_SIMPLE_FILE_SYSTEM_PROTOCOL *sfs = NULL;
        EFI_FILE_HANDLE root = NULL;
        EFI_FILE_HANDLE file = NULL;

        status = uefi_call_wrapper(gBS->OpenProtocol, 6,
                                   handles[i],
                                   &gEfiSimpleFileSystemProtocolGuid,
                                   (void **)&sfs,
                                   g_image_handle,
                                   NULL,
                                   EFI_OPEN_PROTOCOL_GET_PROTOCOL);
        if (EFI_ERROR(status)) {
            Print(L"UEFI: SFS[%u] OpenProtocol failed: %r\n", (UINT32)i, status);
            continue;
        }

        status = uefi_call_wrapper(sfs->OpenVolume, 2, sfs, &root);
        if (EFI_ERROR(status)) {
            Print(L"UEFI: SFS[%u] OpenVolume failed: %r\n", (UINT32)i, status);
            continue;
        }

        status = uefi_call_wrapper(root->Open, 5, root, &file, path, EFI_FILE_MODE_READ, 0);
        if (!EFI_ERROR(status)) {
            Print(L"UEFI: SFS[%u] found %s\n", (UINT32)i, path);
            uefi_call_wrapper(file->Close, 1, file);
            uefi_call_wrapper(gBS->FreePool, 1, handles);
            return root;
        }

        Print(L"UEFI: SFS[%u] %s not found: %r\n", (UINT32)i, path, status);
        uefi_call_wrapper(root->Close, 1, root);
    }

    uefi_call_wrapper(gBS->FreePool, 1, handles);
    return NULL;
}

__attribute__((noreturn))
static void jump_to_kernel(EFI_PHYSICAL_ADDRESS entry, EFI_SYSTEM_TABLE *st, UINT64 xhci_base) {
    UINTN stack_pages = 16; /* 64 KiB */
    EFI_PHYSICAL_ADDRESS stack_base = 0;
    UINTN stack_top;

    if (uefi_call_wrapper(gBS->AllocatePages, 4, AllocateAnyPages, EfiLoaderData, stack_pages, &stack_base) != EFI_SUCCESS) {
        Print(L"UEFI: failed to allocate stack\n");
        while (1) { }
    }

    stack_top = (UINTN)(stack_base + (stack_pages << 12));
    stack_top &= ~((UINTN)0xF);
    stack_top -= 8; /* make RSP look like a normal call entry (retaddr slot) */

    __asm__ __volatile__(
        "mov %0, %%rsp\n"
        "mov %1, %%rdi\n"
        "mov %2, %%rsi\n"
        "jmp *%3\n"
        :
        : "r"(stack_top), "r"(st), "r"(xhci_base), "r"((void *)(UINTN)entry)
        : "memory"
    );

    while (1) { }
}

EFI_STATUS EFIAPI efi_main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    EFI_STATUS status;
    EFI_FILE_HANDLE root;
    UINT8 *kernel_buf = NULL;
    UINTN kernel_size = 0;
    EFI_PHYSICAL_ADDRESS entry = 0;
    EFI_LOADED_IMAGE *loaded = NULL;
    EFI_SIMPLE_FILE_SYSTEM_PROTOCOL *sfs = NULL;
    EFI_FILE_HANDLE file_root = NULL;
    UINT64 xhci_base = 0;

    InitializeLib(ImageHandle, SystemTable);
    g_image_handle = ImageHandle;

    status = uefi_call_wrapper(gBS->OpenProtocol, 6,
                               ImageHandle,
                               &gEfiLoadedImageProtocolGuid,
                               (void **)&loaded,
                               ImageHandle,
                               NULL,
                               EFI_OPEN_PROTOCOL_GET_PROTOCOL);
    if (EFI_ERROR(status)) {
        print_status(L"UEFI: OpenProtocol(LoadedImage) failed", status);
    } else {
        status = uefi_call_wrapper(gBS->OpenProtocol, 6,
                                   loaded->DeviceHandle,
                                   &gEfiSimpleFileSystemProtocolGuid,
                                   (void **)&sfs,
                                   ImageHandle,
                                   NULL,
                                   EFI_OPEN_PROTOCOL_GET_PROTOCOL);
        if (EFI_ERROR(status)) {
            print_status(L"UEFI: OpenProtocol(SimpleFileSystem) failed", status);
        }
    }

    if (!EFI_ERROR(status)) {
        status = uefi_call_wrapper(sfs->OpenVolume, 2, sfs, &file_root);
        if (EFI_ERROR(status)) {
            file_root = NULL;
        }
    }

    if (!file_root) {
        file_root = find_root_for_path(L"kernel_uefi.elf");
    }

    root = file_root;
    if (!root) {
        Print(L"UEFI: cannot open root\n");
        wait_key(SystemTable);
        return EFI_LOAD_ERROR;
    }

    status = read_file(root, L"kernel_uefi.elf", &kernel_buf, &kernel_size);
    if (EFI_ERROR(status)) {
        Print(L"UEFI: cannot read kernel_uefi.elf\n");
        wait_key(SystemTable);
        uefi_call_wrapper(root->Close, 1, root);
        return status;
    }
    uefi_call_wrapper(root->Close, 1, root);

    status = load_kernel_elf(kernel_buf, kernel_size, &entry);
    if (EFI_ERROR(status)) {
        Print(L"UEFI: kernel load failed\n");
        wait_key(SystemTable);
        return status;
    }

    xhci_base = find_xhci_base();
    Print(L"UEFI: calling ExitBootServices() before jumping to kernel...\n");
    status = exit_boot_services(ImageHandle);
    if (EFI_ERROR(status)) {
        print_status(L"UEFI: ExitBootServices failed", status);
        return status;
    }

    jump_to_kernel(entry, SystemTable, xhci_base);
    return EFI_SUCCESS;
}
