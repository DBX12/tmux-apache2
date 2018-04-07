#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

apache_status_icon="#($CURRENT_DIR/scripts/apache_online.sh)";
apache_status_interpolation_string="\#{apache2_status}";

source $CURRENT_DIR/scripts/shared.sh
do_interpolation() {
  local string="$1";
  local interpolated="${string/$apache_status_interpolation_string/$apache_status_icon}";
  echo "$interpolated";
}

update_tmux_option() {
  local option="$1";
  local option_value="$(get_tmux_option "$option")";
  local new_option_value="$(do_interpolation "$option_value")";
  set_tmux_option "$option" "$new_option_value";
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main