# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# PATH
export PATH=$HOME/usr/bin:$PATH
export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH
export PATH=$HOME/.local/bin/:$PATH
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

# Others
export FPATH=$FPATH:$HOME/.zfunc
export EDITOR='nvim'
export DATASETS=$HOME/data/

# Setting for perl macOS/Linux compatibility
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Create env variabel to know who you are
export SYSTEM_TYPE=$(uname -s)

# For local user installs
export CPATH=$HOME/usr/include/
export LD_LIBRARY_PATH=$HOME/usr/lib:$LD_LIBRARY_PATH
