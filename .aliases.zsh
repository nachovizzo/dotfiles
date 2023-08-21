# @file      .aliases.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2022 Ignacio Vizzo, all rights reserved
alias -g latest='*(om[1])'
alias cb="cmake --build build -j"
alias cm="cmake -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
alias de='cd ~/dev'
alias deko='cd ~/Desktop'
alias dekoo='cd ~/Desktop'
alias df='df -h -xsquashfs -xtmpfs -xdevtmpfs'
alias ex='cd ~/dev/examples'
alias gs="git status"
alias ll='ls -hltrBF --color=auto'
alias meld='light_meld'
alias mkae='make'
alias py='ipython3'
alias tkb='take build'
alias tmux='tmux -2'
alias ts='tmux new-session -s $(basename $(pwd))'
alias vim='nvim'
alias xcopy='xclip -selection clipboard'
alias xopen='xdg-open'
alias ydam='yadm'
