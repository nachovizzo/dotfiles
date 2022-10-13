# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# PATH
export PATH=$PATH:$HOME/scripts/
export PATH=$PATH:$HOME/usr/bin
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$(ls -d $HOME/3rdparty/*/)
export FPATH=$FPATH:$HOME/.zfunc

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Make sure Google Tests run always with a colored output
export GTEST_COLOR=1

# This allow you to install a package if it's not found on the system
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
# export TERM=screen-256color

# Usefull variables
export DATASETS=$HOME/data/
export MODELS=$HOME/data/models/

# Virtual environments
export VIRTUALENV=$HOME/dev/virtualenv/
export AUTOSWITCH_SILENT=true

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# Time format
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'
