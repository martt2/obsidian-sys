ARG IMG=debian
FROM $IMG

# argumentos via cli
ARG USER=obsidian
ARG UID
ARG GID

USER root

WORKDIR /usr/local

SHELL [ "/bin/bash", "-c" ]

# cria o usuario host
RUN if ! id -u $USER &> /dev/null; then \
    groupadd -g $GID $USER && \
    useradd -m -u $UID -g $GID $USER; \
fi

# ---
# dir
# ---

# criar diretorios
RUN \
    mkdir -p ./src/obsidian; \
    mkdir -p ./etc/obsidian; \
    mkdir -p /mnt/vault; \
    mkdir -p /mnt/storage; \
    mkdir -p /tmp/server;

# permisões do USER
RUN \
    chown -R $USER:$USER ./src/obsidian \
    chown -R $USER:$USER /mnt/storage; \
    chown -R $USER:$USER /mnt/vault; \
    chown -R $USER:$USER /tmp/server;

# ---

# ---
# package
# ---

# copiar package
COPY ./package ./src/obsidian/package

# distribui os arquivos de package
RUN \
    cp -r ./src/obsidian/package/cmd ./src/obsidian/cmd;
    # cp -r ./src/obsidian/package/rc/env ./etc/obsidian/env

# ---

# ---
# cmd
# ---

# concede execução
RUN \
    chmod +x ./src/obsidian/cmd/*; \
    chmod +x ./src/obsidian/cmd/lib/*;

# links shell
RUN \
    ln -sf /usr/local/src/obsidian/cmd/cli.sh ./bin/obsidian-cli; \
    ln -sf /usr/local/src/obsidian/cmd/main.sh ./bin/obsidian-main;

# ---

# ---
# shell
# ---

# zsh configuracoes
RUN if [[ -f /bin/zsh ]]; then \
    touch /home/$USER/.zshrc; \
    grep -q "^# obsidian personal configuration" /home/$USER/.zshrc || \
        cat ./src/obsidian/package/rc/zsh/zshrc >> /home/$USER/.zshrc; \
fi

# bash configuracoes
RUN if [[ -f /bin/bash ]]; then \
    touch /home/$USER/.bashrc; \
    grep -q "^# obsidian personal configuration" /home/$USER/.bashrc || \
        cat ./src/obsidian/package/rc/bash/bashrc >> /home/$USER/.bashrc; \
fi

# ---

# ---
# install
# ---

# dependencias do sistema
RUN apt-get update && \
    apt-get install -y $(cat ./src/obsidian/package/install/bash) && \
    rm -rf /var/lib/apt/lists/*

# ---

USER $USER

ENV TERM=xterm-256color

WORKDIR /home/$USER

CMD [ "/usr/local/bin/obsidian-main" ]
