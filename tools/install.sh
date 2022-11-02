#!/bin/bash
set -e

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

user_can_sudo() {
  command_exists sudo || return 1
  ! LANG= sudo -n -v 2>&1 | grep -q "may not run sudo"
}

install_git() {
  RUN=$(user_can_sudo && echo "sudo" || echo "command")
  $RUN apt-get update
  $RUN apt-get install --no-install-recommends -y git
}

install_yadm() {
  # TODO: Add support for non-root user, else loop is already working
  mkdir -p $HOME/.local/bin && export PATH=$PATH:$HOME/.local/bin/
  curl -fLo $HOME/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x $HOME/.local/bin/yadm
}

main() {
  # Parse arguments
  while [ $# -gt 0 ]; do
    case $1 in
      --full) export INSTALL_FULL=yes ;;
    esac
    case $1 in
      --skip-decrypt) export DECRYPT=no ;;
    esac
    shift
  done

  install_git
  install_yadm

  # If cloning fails, this means that yadm is already installed and we shoudl bootstrap
  yadm clone --bootstrap https://github.com/nachovizzo/dotfiles.git 2>/dev/null || yadm bootstrap
}

main "$@"
