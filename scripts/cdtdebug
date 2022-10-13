#!/usr/bin/env bash
# This is a slightly modified version of the cdtdebug.sh form the ECLPISE project
###############################################################################
# Copyright (c) 2014, 2015 Red Hat, Inc. and others
# Copyright (c) 2021 Ignacio Vizzo, all rights reserved(for modifications)
#
# This program and the accompanying materials
# are made available under the terms of the Eclipse Public License 2.0
# which accompanies this distribution, and is available at
# https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#    Red Hat Inc. - initial API and implementation
#    Marc Khouzam (Ericsson) - Update for remote debugging support (bug 450080)
#    Ignacio Vizzo (University of Bonn) - Make it work
#
###############################################################################
# Instructions:
#
# You should read at least once the offical documentation:
#  - https://wiki.eclipse.org/CDT/StandaloneDebugger
#  - Download the latest cdt-standalone debugger release (not supported anymore) at:
#    - https://download.eclipse.org/tools/cdt/releases/10.1/cdt-10.1.0/rcp/
#  - Untar the content into $HOME/dev/cdtdebugger/debugger/
#  - Run this script from wherever you need, I have it on my $PATH, so it's acessible from wherever
###############################################################################

export GTK_THEME="Adwaita:light"
# NOTE: If you installed on somewhere else then you should change this
CDT_DEBUGGER="$HOME/dev/cdtdebugger"
CURR_DIR=${PWD##*/}
WORKSPACE="$CDT_DEBUGGER/workspaces/$CURR_DIR"
mkdir -p "$WORKSPACE"

usage="\
Usage: $0 [ECLIPSE_OPTIONS] [-b BUILD_LOG] [TARGET_OPTION]

Debug an executable, core-file, or an existing process using the Eclipse
C/C++ Stand-alone Debugger.  Eclipse command-line options may be passed
except for -vmargs which is being used to start up the Eclipse Debugger.

Operation modes:
  -h, --help                print this help, then exit

Indexing assist options:
  -b BUILD_LOG              build log to use for compiler includes/flags

Target options:
  -a [pid]                  attach using the optional pid or prompt for a pid 
  -c COREFILE               debug core-file (should also specify executable)
  -e EXECUTABLE [ARGS...]   debug given executable (passing ARGS to main)
  -r ADDRESS:PORT           debug toward the specified remote server. Can be
                            combined with the -a option.

The -e option must be used last as subsequent options are passed to main.

Specifying insufficient arguments for a particular target will result in a
dialog displayed to enter the required values for that target.  Specifying
no target option brings up a dialog for debugging an executable with the
executable path, program arguments, and build log filled in from the last -e
invocation, if one exists.

Wiki page: <http://wiki.eclipse.org/CDT/StandaloneDebugger>"

exit_missing_arg='
  echo $0": error: option [$1] requires an argument"; exit 1'

# Parse command line.
i=0
while test $# -gt 0; do
  case $1 in
    --help | -h)
      echo "$usage"
      exit
      ;;
    -vmargs)
      echo $0": error: -vmargs option is prohibited"
      exit 1
      ;;
    -e)
      test $# = 1 && eval "$exit_missing_arg"
      options[i]="$1"
      let "i+=1"
      options[i]="$2"
      let "i+=1"
      shift
      shift
      # Get all options after -e and protect them from being
      # processed by Eclipse as Eclipse options
      while test $# -gt 0; do
        options[i]=$1
        let "i+=1"
        shift
      done
      ;;
    -c | -r)
      test $# = 1 && eval "$exit_missing_arg"
      options[i]="$1"
      let "i+=1"
      options[i]="$2"
      let "i+=1"
      shift
      shift
      ;;
    *)
      options[i]="$1"
      let "i+=1"
      shift
      ;;
  esac
done

# Run eclipse with the Stand-alone Debugger product specified
$CDT_DEBUGGER/debugger/cdtdebug -data "$WORKSPACE" "${options[@]}"
