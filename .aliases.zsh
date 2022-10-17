# @file      .aliases.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2022 Ignacio Vizzo, all rights reserved
alias py='ipython3'
alias coit='code . && exit'
alias cor='code -r'
alias deko='cd ~/Desktop'
alias ex='cd ~/dev/examples'
alias te='cd ~/Teaching'
alias re='cd ~/Research/'
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
alias ts='tmux new-session -s $(basename $(pwd))'
alias ydam='yadm'
alias mkae='make'
alias cat='bat'
alias meld='light_meld'

