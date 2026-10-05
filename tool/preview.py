"""Serve the static build locally with Cloudflare Pages-style extensionless HTML."""
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlsplit

ROOT = Path(__file__).resolve().parents[1] / 'build' / 'jaspr'


class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(ROOT), **kwargs)

    def send_error(self, code, message=None, explain=None):
        if code == 404 and (ROOT / '404.html').is_file():
            body = (ROOT / '404.html').read_bytes()
            self.send_response(404)
            self.send_header('Content-Type', 'text/html; charset=utf-8')
            self.send_header('Content-Length', str(len(body)))
            self.end_headers()
            if self.command != 'HEAD':
                self.wfile.write(body)
        else:
            super().send_error(code, message, explain)

    def do_GET(self):
        path = urlsplit(self.path).path
        if path == '/privacy':
            self.path = '/privacy.html'
        super().do_GET()


if __name__ == '__main__':
    print('Preview: http://127.0.0.1:8090', flush=True)
    ThreadingHTTPServer(('127.0.0.1', 8090), Handler).serve_forever()
