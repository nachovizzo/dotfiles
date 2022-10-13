# @file      fwalch-hostname.zsh-theme
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

# Set required options
#
# Load required modules
#
autoload -Uz vcs_info

# Set vcs_info parameters
#
zstyle ':vcs_info:*' enable hg bzr git
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' formats "$FX[bold]%r$FX[no-bold]/%S" "%s/%b" "%%u%c"
zstyle ':vcs_info:*:*' actionformats "$FX[bold]%r$FX[no-bold]/%S" "%s/%b" "%u%c (%a)"
zstyle ':vcs_info:*:*' nvcsformats "%~" "" ""

# Display information about the current repository
#
repo_information() {
  vcs_info # Get version control info before we start outputting stuff
  echo "%F{blue}${vcs_info_msg_0_%%/.}"
}

# Get the current hostname, only valid though SSH connections. Still looks ugly
# but didn't find a better way
local hostname="%{$fg_bold[yellow]%}[@%m]"

PROMPT='${hostname} $(repo_information)$FX[bold]%F{blue}$(git_prompt_info)%f$FX[no-bold] '

ZSH_THEME_GIT_PROMPT_PREFIX=" (%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{blue}) %F{yellow}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{blue})"
