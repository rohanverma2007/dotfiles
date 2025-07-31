#!/bin/bash

# Get ncspot socket - check multiple possible locations
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/ncspot"
RUNTIME_DIR="/run/user/$(id -u)/ncspot"

if [ -S "$RUNTIME_DIR/ncspot.sock" ]; then
    SOCKET="$RUNTIME_DIR/ncspot.sock"
elif [ -S "$CACHE_DIR/ncspot.sock" ]; then
    SOCKET="$CACHE_DIR/ncspot.sock"
else
    echo ""
    exit 0
fi

if command -v socat >/dev/null 2>&1; then
    echo "DEBUG: Using socat" >&2
    TRACK_INFO=$(timeout 2s sh -c 'echo "" | socat - UNIX-CONNECT:"$1"' _ "$SOCKET" 2>/dev/null | head -n1)
elif command -v nc >/dev/null 2>&1; then
    echo "DEBUG: Trying nc variants" >&2
    TRACK_INFO=$(timeout 2s sh -c 'echo "" | nc -U "$1" 2>/dev/null || echo "" | nc "$1" 2>/dev/null' _ "$SOCKET" | head -n1)
else
    echo "DEBUG: Using bash fallback" >&2
    # Fallback using bash built-ins
    exec 3<>"$SOCKET" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "" >&3
        TRACK_INFO=$(timeout 2s cat <&3 2>/dev/null | head -n1)
        exec 3>&-
    else
        echo "DEBUG: Could not open socket" >&2
        echo ""
        exit 0
    fi
fi


TITLE=$(echo "$TRACK_INFO" | jq -r '.playable.title // ""' 2>/dev/null)
ARTIST=$(echo "$TRACK_INFO" | jq -r '.playable.artists[0] // ""' 2>/dev/null)
STATUS=$(echo "$TRACK_INFO" | jq -r '.mode | keys[0] // ""' 2>/dev/null)

# Truncate long strings to prevent waybar overflow
if [ ${#TITLE} -gt 30 ]; then
    TITLE="${TITLE:0:27}..."
fi
if [ ${#ARTIST} -gt 25 ]; then
    ARTIST="${ARTIST:0:22}..."
fi

# Output formatted string
if [ -n "$TITLE" ] && [ -n "$ARTIST" ]; then  
    echo "$ARTIST - $TITLE"
else
    echo ""
fi
