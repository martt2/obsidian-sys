ARG IMG=debian
FROM $IMG

# argumentos via cli 
ARG DEV=0
ARG USER=obsidian
ARG UID
ARG GID

USER root

WORKDIR /usr/local/src/obsidian

COPY . .

SHELL [ "/bin/bash", "-c" ]

# cria o usuario host
RUN if ! id -u $USER &> /dev/null; then \
    groupadd -g $GID $USER && \
    useradd -m -u $UID -g $GID $USER && \
    chown -R $USER:$USER /usr/local/src/obsidian; \
fi

# links shell
RUN \
    ln -sf /usr/local/src/vault/sys/cmd/app.sh /usr/local/bin/obsidian-app; \
    ln -sf /usr/local/src/vault/sys/cmd/cli.sh /usr/local/bin/obsidian-cli;

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

# extrair o vault
RUN if [[ $DEV == 0 ]]; then \
    mkdir -p /usr/local/src/vault; \
    unzip ./vault/vault-00.01.00.zip -d /usr/local/src/vault; \
fi

# configurar vault
RUN if [[ -d /usr/local/src/vault ]]; then \
    mv /usr/local/src/vault/obsidian /usr/local/src/vault/.obsidian; \
    chown -R $USER:$USER /usr/local/src/vault; \
fi

# concede execução para os scripts shell
RUN if [[ -d /usr/local/src/vault/ ]]; then \
    chmod +x /usr/local/src/vault/sys/cmd/*; \
    chmod +x /usr/local/src/vault/sys/cmd/lib/*; \
fi

USER $USER

# links armazenamento
# RUN \
#     ln -sf /usr/local/src/vault   /home/$USER/vault; \
#     ln -sf /usr/local/src/storage /home/$USER/storage;

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