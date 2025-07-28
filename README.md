# 🟣 Obsidian

## 🔍 Sobre
Sistema de gerenciamento de arquivos no obsidian

## ⚙️ Configuração e Execução

Dentro do diretório da versão ( exemplo: `./app-v-00.01.01` ) execute as seguintes operações

### Criando um env

Crie um arquivo `./env` com as seguintes informações

```bash
VERSION=00.01.01 # versao do vault utilizada
IMG_BASE=debian # nome da imagem base
IMG_NAME=obsidian # nome da imagem do obsidian criada 
VAULT=/path/to/vault # caminho do vault
STORAGE=/path/to/storage # caminho do storage
```

### 🐳 Instalação do container do Docker

> 💡 **Dica:** Torne `./exe` executável com o comando:
>
> ```bash
> chmod +x ./exe
> ```

- 1️⃣ Baixe uma imagem `base` (ex: Debian):
  
    ```bash
    docker pull debian:latest
    ```

- 2️⃣ Rode um container temporário e comite como `app.base`:

    ```bash
    docker run --name run.debian --rm -it debian /bin/bash
    docker commit -p run.debian app.debian
    ```

- 3️⃣ Construa a imagem do projeto com esta imagem:

    ```bash
    ./exe build
    ```

- 4️⃣ Inicie o progama:

    ```bash
    ./exe run
    ```
