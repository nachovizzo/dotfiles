#!/usr/bin/env zsh
# Fix zsh autocomplete in zsh
# https://github.com/ros2/ros2cli/issues/534#issuecomment-957516107

# Fix zsh autocomplete in zsh
if [ -f /opt/ros/${ROS_DISTRO}/setup.zsh ]; then
  source /opt/ros/${ROS_DISTRO}/setup.zsh
  complete -o nospace -o default -F _python_argcomplete "ros2"
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
fi
