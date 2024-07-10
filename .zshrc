([[ -n $DOCKER_ENV ]] || [[ -n $SSH_CONNECTION ]]) && ZSH_THEME="fwalch-hostname" || ZSH_THEME="fwalch"
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
    fzf-tab
    git
    tmux
    virtualenv
    z
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.zsh
source $HOME/.functions.zsh
source $HOME/.ros.sh
source $HOME/.zshrc_local 2>/dev/null || true

