
active_icon_osx="✅ ";
active_icon="✔";
inactive_icon_osx="⛔️ ";
inactive_icon_cygwin="X";
inactive_icon="❌ ";

is_osx() {
	[ $(uname) == "Darwin" ]
}

is_cygwin() {
	[[ $(uname) =~ CYGWIN ]]
}

is_freebsd() {
	[ $(uname) == FreeBSD ]
}

get_tmux_option() {
	local option=$1
	local default_value=$2
	local option_value=$(tmux show-option -gqv "$option")
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}

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
