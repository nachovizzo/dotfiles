#!/bin/bash
set -e

install_brew() {
  export NONINTERACTIVE=1
  # We need sudo to bootstrap hombrew
  sudo whoami >/dev/null 2>&1 \ 
    && bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    || exit 1
  # eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
}

main() {
  # Parse arguments
  while [ $# -gt 0 ]; do
    case $1 in
      --decrypt) export DECRYPT=yes ;;
    esac
    shift
  done

  install_brew

  brew install yadm
  yadm clone --bootstrap https://github.com/nachovizzo/dotfiles.git 2>/dev/null || yadm bootstrap
  yadm remote set-url origin "git@github.com:nachovizzo/dotfiles.git"
}

main "$@"
