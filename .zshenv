source $HOME/.env
export ZSH=$HOME/.oh-my-zsh
export FPATH=$FPATH:$HOME/.zfunc
export HISTFILE=$HOME/.bash_history

# Load secrets ENV variables (AWS keys mainly)
for secret in $HOME/.secrets/*.sh(N); do source ${secret}; done

# no brew no love. For bash? no care
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || true)"
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv 2>/dev/null || true)"
fi

# Fix zsh autocomplete in zsh
if [ -f /opt/ros/${ROS_DISTRO}/setup.zsh ]; then
  source /opt/ros/${ROS_DISTRO}/setup.zsh
  complete -o nospace -o default -F _python_argcomplete "ros2"
fi
