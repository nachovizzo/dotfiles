#!/usr/bin/env zsh
# Fix zsh autocomplete in zsh
# https://github.com/ros2/ros2cli/issues/534#issuecomment-957516107
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"
