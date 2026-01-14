# lmstudio_strip_tool_calls_proxy.py
# Python 3.8+ (standard library only)
#
# Proxies OpenAI-compatible requests to LM Studio and removes:
#   choices[*].message.tool_calls == []
#
# Run:
#   python lmstudio_strip_tool_calls_proxy.py
# Then point clients to:
#   http://127.0.0.1:4010/v1

from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import json
import urllib.request
import urllib.error

UPSTREAM_BASE = "http://127.0.0.1:1234"  # LM Studio server
LISTEN_HOST = "127.0.0.1"
LISTEN_PORT = 4010

HOP_BY_HOP_HEADERS = {
    "connection", "keep-alive", "proxy-authenticate", "proxy-authorization",
    "te", "trailer", "transfer-encoding", "upgrade", "host", "content-length"
}
def normalize_model_name(payload: dict) -> dict:
    """
    LM Studio expects bare model ids (as in /v1/models), e.g. 'qwen2.5-coder-32b-instruct'.
    Aider/LiteLLM often sends 'openai/<id>' or 'lm_studio/<id>'.
    """
    if not isinstance(payload, dict):
        return payload
    m = payload.get("model")
    if isinstance(m, str):
        for prefix in ("openai/", "lm_studio/"):
            if m.startswith(prefix):
                payload["model"] = m[len(prefix):]
                break
    return payload

def strip_empty_tool_calls(obj):
    """
    Remove message.tool_calls if it is an empty list.
    Applies to OpenAI-style chat.completion responses:
      { "choices": [ { "message": { "tool_calls": [] } } ] }
    """
    if not isinstance(obj, dict):
        return obj

    choices = obj.get("choices")
    if isinstance(choices, list):
        for ch in choices:
            if not isinstance(ch, dict):
                continue
            msg = ch.get("message")
            if isinstance(msg, dict) and msg.get("tool_calls") == []:
                del msg["tool_calls"]
    return obj

class ProxyHandler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"

    def _read_body(self) -> bytes:
        length = self.headers.get("Content-Length")
        if not length:
            return b""
        return self.rfile.read(int(length))

    def _forward(self):
        path = self.path
        url = UPSTREAM_BASE + path

        body = self._read_body()
        # If JSON request, normalize model name (strip 'openai/' prefix)
        req_content_type = self.headers.get("Content-Type", "")
        if body and "application/json" in req_content_type.lower():
            try:
                payload = json.loads(body.decode("utf-8"))
                # DEBUG: log what the client sent (Aider)
                try:
                    print(f"[IN ] {self.command} {self.path} model={payload.get('model')}")
                except Exception:
                    print(f"[IN ] {self.command} {self.path}")

                payload = normalize_model_name(payload)
                body = json.dumps(payload, ensure_ascii=False).encode("utf-8")
            except Exception:
                pass

        # Copy headers, removing hop-by-hop headers
        out_headers = {}
        for k, v in self.headers.items():
            if k.lower() in HOP_BY_HOP_HEADERS:
                continue
            out_headers[k] = v

        req = urllib.request.Request(url, data=body if body else None, method=self.command, headers=out_headers)

        try:
            with urllib.request.urlopen(req, timeout=600) as resp:
                status = resp.status
                resp_headers = dict(resp.getheaders())
                resp_body = resp.read()
        except urllib.error.HTTPError as e:
            status = e.code
            resp_headers = dict(e.headers.items()) if e.headers else {}
            resp_body = e.read() if hasattr(e, "read") else b""
        except Exception as e:
            # Return 502 if upstream is unreachable
            msg = {"error": "bad_gateway", "detail": str(e)}
            data = json.dumps(msg, ensure_ascii=False).encode("utf-8")
            self.send_response(502)
            self.send_header("Content-Type", "application/json; charset=utf-8")
            self.send_header("Content-Length", str(len(data)))
            self.end_headers()
            self.wfile.write(data)
            return

        # If JSON response, strip empty tool_calls
        content_type = resp_headers.get("Content-Type", "")
        if "application/json" in content_type.lower() and resp_body:
            try:
                obj = json.loads(resp_body.decode("utf-8"))
                obj = strip_empty_tool_calls(obj)
                resp_body = json.dumps(obj, ensure_ascii=False).encode("utf-8")
            except Exception:
                # If parsing fails, keep original body
                pass

        # Send response back
        self.send_response(status)

        # Copy response headers (excluding hop-by-hop + old content-length)
        for k, v in resp_headers.items():
            if k.lower() in HOP_BY_HOP_HEADERS:
                continue
            # Some servers send multiple Content-Type values; keep it simple
            if k.lower() == "content-length":
                continue
            self.send_header(k, v)

        self.send_header("Content-Length", str(len(resp_body)))
        self.end_headers()
        if resp_body:
            self.wfile.write(resp_body)

    def do_POST(self):  # noqa: N802
        self._forward()

    def do_GET(self):  # noqa: N802
        self._forward()

    def log_message(self, format, *args):
        super().log_message(format, *args)


def main():
    server = ThreadingHTTPServer((LISTEN_HOST, LISTEN_PORT), ProxyHandler)
    print(f"Proxy listening on http://{LISTEN_HOST}:{LISTEN_PORT}  ->  {UPSTREAM_BASE}")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()

if __name__ == "__main__":
    main()
