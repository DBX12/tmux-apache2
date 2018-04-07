# Tmux Apache2 & MySQL status

Tmux plugin that enables displaying the status of Apache2 and MySQL by introducing the interpolations `#{apache2_status}`
and `#{mysqld_status}`.

This plugin was highly inspired by [tmux-online-status](https://github.com/tmux-plugins/tmux-online-status) and much
functions are borrowed from there.

### Usage

Add the interpolations to the format string in your `.tmux.conf` for your status bar like this:

    set -g status-right "Apache2: #{apache2_status} | MySQL: #{mysqld_status} | %a %h-%d %H:%M"

### Configure icons
If you don't like the icons, you can override them by setting this in your `.tmux.conf`

    set -g @active_icon "Ok"
    set -g @inactive_icon "Dead"

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add the plugin to the plugin list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'DBX12/tmux-apache2'

Hit `prefix+I` to fetch the plugin and source it.
The interpolations should work now.

### Manual installation

Clone this repository:

    git clone https://github.com/DBX12/tmux-apache2

Add this line to the end of your `.tmux.conf`:

    run-shell /path/to/the/clone/tmux-apache2.tmux

It's important, that this line is **after** the `set -g status-right ...` line.

If you are already running tmux, reload the tmux configuration with

    tmux source ~/.tmux.conf

otherwise just start tmux.

### Limitations

The status change will not be instantly displayed in the status bar. This is because tmux refreshes
the status bar every `x` seconds and not continuosly.
You can change the update interval with:

    set -g status-interval 5

This will refresh the status every 5 seconds.

### License
[MIT](LICENSE)
