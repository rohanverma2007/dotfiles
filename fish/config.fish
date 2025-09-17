if status is-interactive
    # Set XDG_RUNTIME_DIR if not already set
    if not set -q XDG_RUNTIME_DIR
        set -gx XDG_RUNTIME_DIR "/tmp/"(id -u)"-runtime"
    end

    # Create the directory if it doesn't exist
    if not test -d "$XDG_RUNTIME_DIR"
        doas mkdir -p "$XDG_RUNTIME_DIR"
        doas chown (id -u):(id -g) "$XDG_RUNTIME_DIR"
        chmod 0700 "$XDG_RUNTIME_DIR"
    end

    # Auto-start Sway on TTY1 if not already running
    if test (tty) = /dev/tty1 -a -z "$DISPLAY" -a -z "$WAYLAND_DISPLAY"
        #exec ~/.local/bin/start-sway
    end

    # Commands to run in interactive sessions can go here
end

# ~/.config/fish/config.fish

starship init fish | source

set fish_greeting
doas mount -a 2>/dev/null
#doas udevadm control --reload-rules && doas udevadm trigger
