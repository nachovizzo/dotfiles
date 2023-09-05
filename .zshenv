# Homebrew env setup
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv 2>/dev/null || true)"
eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || true)"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# PATH
export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$HOME/.local/bin/:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/usr/bin:$PATH
export PATH=$HOMEBREW_PREFIX/opt/llvm/bin:$PATH

# Others
export FPATH=$FPATH:$HOME/.zfunc
export EDITOR='nvim'
export DATASETS=$HOME/data/
export TERM=xterm-256color

# Setting for perl macOS/Linux compatibility
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Create env variabel to know who you are
export SYSTEM_TYPE=$(uname -s)

# GPG drives me nuts trying to guess this, just spit ttty
export GPG_TTY=$(tty)
