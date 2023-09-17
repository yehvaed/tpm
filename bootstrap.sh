#!/usr/bin/env bash
# vim :filetype=bash

export CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export HOME_DIR="${XDG_DATA_HOME-${HOME}/.local/share}/$(basename ${CURRENT_DIR})"
export PLUGINS_DIR="${HOME_DIR}/plugins"
export DEBUG_OPT=""

plugins_script_path="${CURRENT_DIR}/scripts/plugins.sh"

counter=1

new-command() {
  tmux set -s command-alias[$((1000 + ${counter}))] "$1"="$2"
  counter=$(( counter + 1))
}

new-command "@install" "run-shell '${plugins_script_path}'"
new-command "@update" "run-shell '${plugins_script_path} update'"
new-command "@clean" "run-shell '${plugins_script_path} clean'"

source ${plugins_script_path}
