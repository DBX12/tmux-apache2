#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

active_option_string="@active_icon";
inactive_option_string="@inactive_icon";

active_icon_osx="✅ ";
active_icon="✔";
inactive_icon_osx="⛔️ ";
inactive_icon_cygwin="X";
inactive_icon="❌ ";

source $CURRENT_DIR/shared.sh;

active_icon_default () {
	if is_osx; then
		echo "$active_icon_osx";
	else
		echo "$active_icon";
	fi
}

inactive_icon_default() {
	if is_osx; then
		echo "$inactive_icon_osx";
	elif is_cygwin; then
		echo "$inactive_icon_cygwin";
	else
		echo "$inactive_icon";
	fi
}

apache2_is_running() {
  pgrep "apache2" >/dev/null 2>&1 ;
  if [ $? -eq 0 ]; then
    return 0;
  else
    return 1;
  fi
}

print_icon() {
  if $(apache2_is_running); then
    printf "$(get_tmux_option "$active_option_string" "$(active_icon_default)")";
  else
    printf "$(get_tmux_option "$inactive_option_string" "$(inactive_icon_default)")";
  fi
}

main() {
  print_icon
}

main
