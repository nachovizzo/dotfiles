# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# load zsh/bash shared env
source $HOME/.env

# Create env variabel to know who you are
export SYSTEM_TYPE=$(uname -s)

# no brew no love. For bash? no care
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || true)"
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv 2>/dev/null || true)"
fi
