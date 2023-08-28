FROM ubuntu:22.04
LABEL maintainer="Ignacio Vizzo <ignaciovizzo@gmail.com>"

ENV LANG=en_US.UTF-8
ENV PATH="$PATH:/root/.local/bin"

# Install bare-minumin .config/yadm to bootstrap the installation
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

RUN  mkdir -p /root/.local/bin && export PATH=$PATH:/root/.local/bin/ \
    && curl -fLo /root/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm \
    && chmod a+x /root/.local/bin/yadm \
    && yadm clone https://github.com/nachovizzo/dotfiles.git

COPY .config /root/.config

# Test (move to CI) that the bootstrap sciprt is idempotent
RUN yadm bootstrap

# TODO: Find a way to test this as well
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/nachovizzo/dotfiles/main/.config/yadm/install.sh)"


# WORKDIR /root
# CMD ["zsh"]
