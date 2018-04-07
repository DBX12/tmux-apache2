#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

source $CURRENT_DIR/shared.sh;

mysqld_is_running() {
  pgrep "mysqld" >/dev/null 2>&1 ;
  if [ $? -eq 0 ]; then
    return 0;
  else
    return 1;
  fi
}

print_icon() {
  if $(mysqld_is_running); then
    printf "$(get_tmux_option "$active_option_string" "$(active_icon_default)")";
  else
    printf "$(get_tmux_option "$inactive_option_string" "$(inactive_icon_default)")";
  fi
}

main() {
  print_icon
}

main
