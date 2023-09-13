source $HOME/.env
export ZSH=$HOME/.oh-my-zsh
export FPATH=$FPATH:$HOME/.zfunc
export HISTFILE=$HOME/.bash_history

# no brew no love. For bash? no care
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || true)"
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv 2>/dev/null || true)"
fi
