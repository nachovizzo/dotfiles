[[ -n $SSH_CONNECTION ]] && ZSH_THEME="fwalch-hostname" || ZSH_THEME="no_prompt"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"
HYPHEN_INSENSITIVE="true"
ZSH_TMUX_AUTOCONNECT="false"
ZSH_TMUX_AUTOQUIT="true"
ZSH_TMUX_AUTOSTART="false"

plugins=(
    colored-man-pages
    command-not-found
    extract
    fzf
    git
    tmux
    z
)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.zsh
source $HOME/.functions.zsh
source $HOME/.zshrc_local
