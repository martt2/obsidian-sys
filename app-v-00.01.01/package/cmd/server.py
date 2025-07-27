import socket
import subprocess
from datetime import datetime
import threading
import os

HOST = '0.0.0.0'
PORT = 5000
BIN = '/usr/local/bin/obsidian-cli'
LOG_FILE = '/usr/local/src/obsidian/logs/server.log'

os.makedirs('/usr/local/src/obsidian/logs', exist_ok=True)

def log(msg):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(LOG_FILE, "a") as f:
        f.write(f"[{timestamp}] > {msg}\n")

def handle_client(client_socket, client_address):
    log(f"conection {client_address}")
    data = client_socket.recv(4096).decode('utf-8').strip()
    if not data:
        log(f"empty input from {client_address}")
        return
    log(f"cmd: {data}")
    try:
        completed = subprocess.run(
            f"{BIN} {data}",
            shell=True,
            capture_output=True,
            text=True,
            check=True
        )
        result = completed.stdout
    except subprocess.CalledProcessError as err:
        result = err.stderr
    client_socket.sendall(result.encode())
    client_socket.close()
    

def start_server():
    server = socket.socket( socket.AF_INET, socket.SOCK_STREAM )
    server.bind(( HOST, PORT ))
    server.listen()
    log(f"server started {HOST}:{PORT}")
    try:
        while True:
            client_socket, client_address = server.accept()
            threading.Thread(
                target=handle_client,
                args=(client_socket, client_address),
                daemon=True
            ).start()
    except KeyboardInterrupt:
        log("server stopped manually")
        server.close()

if __name__ == "__main__":
    start_server()