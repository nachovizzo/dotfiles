FROM ubuntu:22.04
LABEL maintainer="Ignacio Vizzo <ignaciovizzo@gmail.com>"

ENV LANG=en_US.UTF-8
ENV PATH="$PATH:/root/.local/bin"
ENV NONINTERACTIVE=1

# Install bare-minumin .config/yadm to bootstrap the installation
RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    git \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen $LANG

# Install git and build-essentials, brew only dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen $LANG

# Install brew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
  && echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.profile 

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" \
  && brew install yadm \
  && yadm clone https://github.com/nachovizzo/dotfiles.git

COPY .config /root/.config

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" \
  && yadm bootstrap

# TODO: Find a way to test this as well
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/nachovizzo/dotfiles/main/.config/yadm/install.sh)"


# WORKDIR /root
# CMD ["zsh"]
