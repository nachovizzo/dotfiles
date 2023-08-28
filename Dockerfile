FROM ubuntu:22.04
LABEL maintainer="Ignacio Vizzo <ignaciovizzo@gmail.com>"

# Install bare-minumin .config/yadm to bootstrap the installation
env LANG=en_US.UTF-8
RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen $LANG

# Run all the magic, bootstrap included
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/nachovizzo/dotfiles/main/.config/yadm/install.sh)"

# Test the full installation (move to CI)
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/nachovizzo/dotfiles/main/.config/yadm/install.sh)" "" --full

# Test (move to CI) that the bootstrap sciprt is idempotent
RUN yadm bootstrap

WORKDIR /root
CMD ["zsh"]
