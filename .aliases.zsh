# @file      .aliases.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2022 Ignacio Vizzo, all rights reserved
alias -g latest='*(om[1])'
alias py='ipython3'
alias coit='code . && exit'
alias cor='code -r'

alias deko='cd ~/Desktop'
alias ex='cd ~/dev/examples'
alias te='cd ~/Teaching'
alias de='cd ~/dev'
alias re='cd ~/Research/'

alias xopen='xdg-open'
alias xcopy='xclip -selection clipboard'
alias ll='ls -hltrBF --color=auto'
alias df='df -h -xsquashfs -xtmpfs -xdevtmpfs'
alias tkb='take build'
alias vim='nvim'
alias tmux='tmux -2'
alias ts='tmux new-session -s $(basename $(pwd))'
alias ydam='yadm'
alias mkae='make'
alias cat='bat'
alias meld='light_meld'
alias gs="git status"

alias cm="cmake -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
