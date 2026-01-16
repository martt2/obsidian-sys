#! /usr/bin/env python3

import uuid
import json
import subprocess
import os
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse
from datetime import datetime

HOST = '0.0.0.0'
PORT = 80
BIN = '/usr/local/bin/obsidian-cli'
LOG_FILE = 'server.log'

os.makedirs('/tmp/share/data', exist_ok=True)
os.makedirs('/tmp/share/log', exist_ok=True)

def set_cors_headers(handler):
    handler.send_header("Access-Control-Allow-Origin", "*")
    handler.send_header("Access-Control-Allow-Methods", "POST, GET, OPTIONS")
    handler.send_header("Access-Control-Allow-Headers", "Content-Type")


def log(msg):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(f"/tmp/share/log/{LOG_FILE}", "a") as f:
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
        client_id = f"{self.client_address[0]}_{self.client_address[1]}_{uuid.uuid4().hex}"
        url = urlparse(self.path)
        content_length = int(self.headers.get('Content-Length', 0))
        body = self.rfile.read(content_length).decode('utf-8').strip()

        try:
            vaule = json.loads(body)
            cmd = vaule.get("cmd", "").strip()
            data = vaule.get("data", {})
        except json.JSONDecodeError:
            self.send_response(400)
            set_cors_headers(self)
            self.end_headers()
            self.wfile.write(b"invalid JSON\n")
            return
        
        log(f"POST :: {client_id}")
        log(f"{url.path} :: cmd={cmd} :: data={data}")

        match url.path:
            case "/cmd":
                try:
                    session = f"session_{client_id}"
                    os.makedirs(f"/tmp/share/data/{session}", exist_ok=True)
                    json.dump(
                        data,
                        open(f"/tmp/share/data/{session}/data.json", "w", encoding="utf-8"),
                        indent=2,
                    )

                    env = os.environ.copy()
                    env["SESSION"] = session

                    res = subprocess.run(
                        f"{BIN} {cmd}",
                        env=env,
                        shell=True,
                        capture_output=True,
                        text=True,
                        check=True
                    )

                    self.send_response(200)
                    set_cors_headers(self)
                    self.end_headers()
                    self.wfile.write(res.stdout.encode())
                    log(res.stdout.encode())

                except subprocess.CalledProcessError as e:
                    self.send_response(500)
                    set_cors_headers(self)
                    self.end_headers()
                    self.wfile.write(e.stderr.encode())
                    log(e.stderr.encode())

                except Exception as e:
                    self.send_response(500)
                    set_cors_headers(self)
                    self.end_headers()
                    self.wfile.write(str(e).encode())
                    log(e.stderr.encode())

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
