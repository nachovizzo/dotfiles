FROM ubuntu:22.04
LABEL maintainer="Ignacio Vizzo <ignaciovizzo@gmail.com>"

# Install bare-minumin .config/yadm to bootstrap the installation
RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

# Install git and build-essentials, brew only dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen $LANG

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/nachovizzo/dotfiles/main/.config/yadm/install.sh)"

WORKDIR /root
CMD ["/home/linuxbrew/.linuxbrew/bin/zsh"]
