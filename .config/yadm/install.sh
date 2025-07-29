#!/bin/bash
set -e

install_brew() {
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || true)"
}

main() {
  # Parse arguments
  while [ $# -gt 0 ]; do
    case $1 in
      --decrypt) export DECRYPT=yes ;;
    esac
    shift
  done

  if [ "$system_type" = "Darwin" ]; then
    install_brew
    brew install yadm
  else
    sudo apt update
    sudo apt install -y yadm
  fi

  yadm clone --bootstrap https://github.com/nachovizzo/dotfiles.git 2>/dev/null || yadm bootstrap
  yadm remote set-url origin "git@github.com:nachovizzo/dotfiles.git"
}

main "$@"
