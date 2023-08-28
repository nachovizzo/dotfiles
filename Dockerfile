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

# Run local insrtallation, for debugging.
RUN apt-get update && apt-get install --no-install-recommends -y \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen $LANG

RUN  mkdir -p $HOME/.local/bin && export PATH=$PATH:$HOME/.local/bin/ \
    && curl -fLo $HOME/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm \
    && chmod a+x $HOME/.local/bin/yadm \
    && sh -c "./.config/yadm/bootstrap"

# TODO: Find a way to test this as well
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/nachovizzo/dotfiles/main/.config/yadm/install.sh)"

# Test (move to CI) that the bootstrap sciprt is idempotent
RUN yadm bootstrap

WORKDIR /root
CMD ["zsh"]
