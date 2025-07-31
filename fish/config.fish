# Add Nix to PATH
if test -d /nix/var/nix/profiles/default/bin
    set -gx PATH /nix/var/nix/profiles/default/bin $PATH
end

if not set -q XDG_DATA_DIRS
    set -x XDG_DATA_DIRS /var/lib/flatpak/exports/share:/usr/local/share:/usr/share
else
    set -x XDG_DATA_DIRS /var/lib/flatpak/exports/share:$XDG_DATA_DIRS
end

# Auto-start Sway with dbus on tty1
if test -z "$DISPLAY" -a -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" = "1"
    exec /usr/local/bin/start-sway
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
fzf --fish | source
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
set -gx PATH ~/.local/bin $PATH

set -gx XCURSOR_THEME Bibata-Modern-Classic
set -gx XCURSOR_SIZE 24

alias bluetooth='bluetui'
alias bootwin='sudo bootctl set-oneshot auto-windows && sudo reboot'
alias grep="rg"
