source $HOME/.env
export ZSH=$HOME/.oh-my-zsh
export FPATH=$FPATH:$HOME/.zfunc
export SHELL_RC=$HOME/.zshrc_local

# Load secrets ENV variables (AWS keys mainly)
for secret in $HOME/.secrets/*.sh(N); do source ${secret}; done

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || true)"
fi

# Load the fuck
command -v thefuck >/dev/null 2>&1 && eval $(thefuck --alias)
