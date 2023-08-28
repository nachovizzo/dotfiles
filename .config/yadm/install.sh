#!/bin/bash
set -e

install_brew() {
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
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
}

main "$@"
