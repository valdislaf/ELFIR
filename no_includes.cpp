// no_includes.cpp

extern "C" long write(int fd, const void* buf, unsigned long count);

extern "C" long add2(long a, long b) {
    return a + b;
}

static unsigned long utoa10(unsigned long x, char* out) {
    // пишет цифры в out, возвращает длину
    char tmp[32];
    unsigned long n = 0;
    do {
        tmp[n++] = char('0' + (x % 10));
        x /= 10;
    } while (x);

    // переворачиваем
    for (unsigned long i = 0; i < n; ++i)
        out[i] = tmp[n - 1 - i];

    return n;
}

int main() {
    long v = add2(3, 7);

    char buf[64];
    unsigned long len = 0;

    // знак
    unsigned long u;
    if (v < 0) {
        buf[len++] = '-';
        u = (unsigned long)(-v);
    } else {
        u = (unsigned long)v;
    }

    len += utoa10(u, buf + len);
    buf[len++] = '\n';

    write(1, buf, len);
    return 0;
}
