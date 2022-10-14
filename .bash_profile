# @file      .bash_profile
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

# If the zsh binary is available, then use the one installed in the system
command -v zsh &> /dev/null && exec zsh -l || test -f ~/.bashrc && . ~/.bashrc
