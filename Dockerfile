ARG IMG=debian
FROM $IMG

# argumentos via cli 
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
RUN mkdir -p download && \
    while IFS= read -r url; do \
        filename=$(basename "$url"); \
        if ! [ -f "./download/$filename" ]; then \
            curl -L -o "./download/$filename" "$url"; \
            dpkg -i "./download/$filename" || true; \
        fi \
    done < ./install/wget && \
    apt-get update && apt-get install -f -y && apt-get clean;

USER $USER

# concede execução para os scripts shell
RUN if [ -d /usr/local/src/vault/ ]; then \
    chmod +x /usr/local/src/vault/sys/cmd/*; \
    chmod +x /usr/local/src/vault/sys/cmd/lib/*; \
fi

# links armazenamento
RUN \
    ln -sf /usr/local/src/vault   /home/$USER/vault; \
    ln -sf /usr/local/src/storage /home/$USER/storage;

# zsh configuracoes
RUN \
    mkdir -p /home/$USER/.obsidian-cli \
    touch /home/$USER/.zshrc; \
    grep -q "^# obsidian personal configuration" /home/$USER/.zshrc || cat ./zsh/zshrc >> /home/$USER/.zshrc; \
    cat ./zsh/env >> /home/$USER/.obsidian-cli/env

ENV TERM=xterm-256color
# ENV LANG=en_US.UTF-8
# ENV LC_ALL=en_US.UTF-8

WORKDIR /home/$USER

CMD [ "/bin/zsh" ]