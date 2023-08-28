#!/bin/bash
set -e

install_brew() {
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
}

user_can_sudo() {
  command_exists sudo || return 1
  command -v sudo >/dev/null 2>&1
  ! LANG= sudo -n -v 2>&1 | grep -q "may not run sudo"
}

RUN=$(user_can_sudo && echo "sudo" || echo "command")

main() {
  # Parse arguments
  while [ $# -gt 0 ]; do
    case $1 in
      --decrypt) export DECRYPT=yes ;;
    esac
    shift
  done

  RUN apt get update && apt get install -y git
  install_brew
  brew install yadm

  # If cloning fails, this means that yadm is already installed and we shoudl bootstrap
  yadm clone --bootstrap https://github.com/nachovizzo/dotfiles.git 2>/dev/null || yadm bootstrap
}

main "$@"
