ARG IMG=debian
FROM $IMG

# argumentos via cli 
ARG VERSION
ARG USER=obsidian
ARG UID
ARG GID

USER root

WORKDIR /usr/local/src/obsidian

COPY . .

SHELL [ "/bin/bash", "-c" ]

# cria diretórios
RUN \ 
    mkdir -p /usr/local/src/storage; \
    mkdir -p /usr/local/src/vault;

# cria o usuario host
RUN if ! id -u $USER &> /dev/null; then \
    groupadd -g $GID $USER && \
    useradd -m -u $UID -g $GID $USER; \
fi

# permisões do USER
RUN \
    chown -R $USER:$USER /usr/local/src/obsidian; \
    chown -R $USER:$USER /usr/local/src/storage; \
    chown -R $USER:$USER /usr/local/src/vault;

# links shell
RUN \
    ln -sf /usr/local/src/vault/sys/cmd/app.sh /usr/local/bin/obsidian-app; \
    ln -sf /usr/local/src/vault/sys/cmd/cli.sh /usr/local/bin/obsidian-cli;

# ---

# dependencias do sistema
RUN apt-get update && \
    apt-get install -y $(cat ./install/bash) && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8

# packages via curl
RUN mkdir -p download; \
    while IFS= read -r url; do \
        filename=$(basename "$url"); \
        if ! [ -f "./download/$filename" ]; then \
            curl -L -o "./download/$filename" "$url"; \
            dpkg -i "./download/$filename" || true; \
        fi \
    done < ./install/wget; \
    apt-get update && apt-get install -f -y && apt-get clean;

# ---

USER $USER

# configurar vault
RUN \
    unzip ./vault/vault-$VERSION.zip -d /usr/local/src/vault; \
    mv /usr/local/src/vault/obsidian /usr/local/src/vault/.obsidian;

# concede execução
RUN \
    chmod +x /usr/local/src/vault/sys/cmd/*; \
    chmod +x /usr/local/src/vault/sys/cmd/lib/*;

# copia cli configuracoes
RUN \
    mkdir -p /home/$USER/.obsidian-cli; \
    cat ./rc/env >> /home/$USER/.obsidian-cli/env;

# zsh configuracoes
RUN if [[ -f /bin/zsh ]]; then \
    touch /home/$USER/.zshrc; \
    grep -q "^# obsidian personal configuration" /home/$USER/.zshrc || cat ./rc/zsh/zshrc >> /home/$USER/.zshrc; \
fi

# bash configuracoes
RUN if ! [[ -f /bin/zsh ]]; then \
    touch /home/$USER/.bashrc; \
    grep -q "^# obsidian personal configuration" /home/$USER/.bashrc || cat ./rc/bash/bashrc >> /home/$USER/.bashrc; \
fi

ENV TERM=xterm-256color
ENV SHELL=/bin/bash
# ENV LANG=en_US.UTF-8
# ENV LC_ALL=en_US.UTF-8

WORKDIR /home/$USER

CMD [ "obsidian-app" ]