from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse
from datetime import datetime
import subprocess
import os

HOST = '0.0.0.0'
PORT = 5000
BIN = '/usr/local/bin/obsidian-cli'
LOG_FILE = 'server.log'

os.makedirs('/usr/local/src/obsidian/logs', exist_ok=True)

def set_cors_headers(handler):
    handler.send_header("Access-Control-Allow-Origin", "*")
    handler.send_header("Access-Control-Allow-Methods", "POST, GET, OPTIONS")
    handler.send_header("Access-Control-Allow-Headers", "Content-Type")


def log(msg):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(f"/usr/local/src/obsidian/logs/{LOG_FILE}", "a") as f:
        f.write(f"[{timestamp}] > {msg}\n")

class server(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        set_cors_headers(self)
        self.end_headers()

    def do_GET(self):
        log(f"GET :: {self.client_address}")
        self.send_response(200)
        set_cors_headers(self)
        self.end_headers()
        self.wfile.write("server on\n".encode())

    def do_POST(self):
        log(f"POST :: {self.client_address}")
        url = urlparse(self.path)

        content_length = int(self.headers.get('Content-Length', 0))
        body = self.rfile.read(content_length).decode('utf-8').strip()

        log(f"{url.path} :: {body}")

        match url.path:
            case "/cmd":
                try:
                    res = subprocess.run(
                        f"{BIN} {body}",
                        shell=True,
                        capture_output=True,
                        text=True,
                        check=True
                    )
                    self.send_response(200)
                    set_cors_headers(self)
                    self.end_headers()
                    self.wfile.write(res.stdout.encode())
                except subprocess.CalledProcessError as e:
                    self.send_response(500)
                    set_cors_headers(self)
                    self.end_headers()
                    self.wfile.write(e.stderr.encode())
                return
            case _:
                self.send_response(404)
                set_cors_headers(self)
                self.end_headers()
                self.wfile.write("path not found\n".encode())
                return

if __name__ == "__main__":
    try:
        log(f"server started {HOST}:{PORT}")
        server = HTTPServer((HOST, PORT), server)
        server.serve_forever()
    except KeyboardInterrupt:
        log("server stopped manually")
        server.server_close()
