#!/usr/bin/env zsh
# @file      cdtdebug
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
source load_colors.zsh
CURR_DIR=${PWD##*/}
CDT_DEBUGGER="$HOME/dev/cdtdebugger"
WORKSPACE="$CDT_DEBUGGER/workspaces/$CURR_DIR"

usage() {
  cat <<EOF
Usage: ${0##*/} [-h] [-c/--core] [-p/--pid]
Launch a gdb session using the standalone cdtdebugger, also possible to debug
core files

    -h          display this help and exit
    -c corefile If you want to do post mostern debug provide the core file. Due
                Implementation issues, you can only run this as the following:
                ${0##*/} -c <corefile> <program>
    -p pid      Attach gdb session to running process. Does not check if the pid
                actully exists
EOF
}

while test $; do
  case $1 in
  -h | -\? | --help)
    usage
    exit
    ;;
  -c | --core)
    if [ "$2" ]; then
      CORE=$2
      shift
    else
      echo 'ERROR: "-c / --core" requires a non-empty option argument.'
      exit 1
    fi
    ;;
  -p | --pid)
    if [ "$2" ]; then
      PID=$2
      shift
    else
      echo 'ERROR: "-p / --pid" requires a non-empty option argument.'
      exit 1
    fi
    ;;
  --)
    shift
    break
    ;;
  -?*)
    printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
    ;;
  *)
    break
    ;;
  esac

  shift
done

# Create sort of "unique" folder for the cdt-debug shit
if [ ! -d "$WORKSPACE" ]; then
  mkdir -p "$WORKSPACE"
fi

PROGRAM=$@
export GTK_THEME="Adwaita:light"
if [ "$CORE" ]; then
  echo "Debugging corefile $CORE, program $PROGRAM"
  $CDT_DEBUGGER/debugger/cdtdebug -data $WORKSPACE -c "$CORE" -e "$PROGRAM"
elif [ "$PID" ]; then
  PROCES_NAME=$(ps -p $PID -o comm=)
  echo "Debugging process ${BOLD_YELLOW}$PROCES_NAME${RESET} with pid=$PID"
  $CDT_DEBUGGER/debugger/cdtdebug -data $WORKSPACE -a "$PID"
else
  # Run the cdt-debugger on the workspace
  echo "Debugging $PROGRAM"
  $CDT_DEBUGGER/debugger/cdtdebug -data $WORKSPACE -e "$PROGRAM"
fi

return 0
