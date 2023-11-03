#!/usr/bin/env bash
# vim :filetype=bash
log() {
	tmux display-message -d 1000 ${DEBUG_OPT} "$@"
}

plugins() {
  local config_file="${HOME}/.tmux.conf"
  local update

  while [[ -n "$@" ]]; do
    case $1 in
      update) update=true; shift
    esac
  done

  cat ${config_file} | while read line; do
    case $line in
      "#"*) continue;;
      *@plugin*)
        local plugin_name=$(echo "$line" | awk '{ print $4; }' | sed "s/[\'\"]//g")

        if [[ ! -d "${plugin_name/'~'/${HOME}}" ]]; then
          local plugin_dir="${PLUGINS_DIR}/${plugin_name//\//---}"

          if [[ ! -d "${plugin_dir}" ]]; then
            log " cloning ${plugin_name}..."
            git clone https://github.com/${plugin_name}.git ${plugin_dir} > /dev/null
          fi

          if [[ -n "${update}" ]]; then
            log " updating ${plugin_name}..."
            (cd ${plugin_dir} && git pull)
          fi
        else
          plugin_dir=${plugin_name/'~'/${HOME}}
        fi

        bash ${plugin_dir}/*.tmux
      ;;
    esac
  done
}

(return 0 2>/dev/null) || plugins $@
