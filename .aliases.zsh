# @file      .aliases.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
command_exists() {
  command -v "$@" >/dev/null 2>&1
}

alias py='ipython3'
alias coit='code . && exit'
alias cor='code -r'
alias deko='cd ~/Desktop'
alias de='cd ~/dev'
alias ex='cd ~/dev/examples'
alias to='cd ~/dev/tools'
alias li='cd ~/dev/libs'
alias te='cd ~/Teaching'
alias re='cd ~/Research/'
alias pu='cd ~/Research/publications'
alias bi='cd ~/Research/bibliography'
alias xopen='xdg-open'
alias gs='git status'
alias xcopy='xclip -selection clipboard'
alias copywd='pwd | tr "\n" "\b" | xclip -selection clipboard'
alias ll='ls -hltrBF --group-directories-first --color=auto'
alias df='df -h -xsquashfs -xtmpfs -xdevtmpfs'
alias tkb='take build'
alias ag='ag -U'
alias glow='glow -p'
alias -g latest='*(om[1])'
alias vim='nvim'
alias ssh='command_exists kitty && kitty +kitten ssh || ssh'
alias ts='tmux new-session -s $(basename $(pwd))'
alias cat='bat'
alias ydam='yadm'
alias mkae='make'
