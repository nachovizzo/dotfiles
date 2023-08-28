FROM ubuntu:22.04
LABEL maintainer="Ignacio Vizzo <ignaciovizzo@gmail.com>"

ENV LANG=en_US.UTF-8
ENV NONINTERACTIVE=1

# Install bare-minumin .config/yadm to bootstrap the installation
RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen $LANG

# Install git and build-essentials, brew only dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen $LANG

RUN ls
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/nachovizzo/dotfiles/main/.config/yadm/install.sh)"

WORKDIR /root

CMD ["/home/linuxbrew/.linuxbrew/bin/zsh"]
