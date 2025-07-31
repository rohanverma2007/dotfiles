#!/bin/bash
# Cider v3.1.0-experimental, no token required
API_URL="http://localhost:10767/api/v1"

get_current_song() {
    # 1. Is Cider reachable?
    if ! curl -s --connect-timeout 1 "$API_URL/playback/active" >/dev/null 2>&1; then
        echo ""
        return
    fi

    # 2. Is something actually playing?
    is_playing=$(curl -s --connect-timeout 1 "$API_URL/playback/is-playing")
    case "$is_playing" in
        *true*|*True*|*1*) : ;;
        *) echo ""; return ;;
    esac

    # 3. Grab song info
    song_info=$(curl -s --connect-timeout 1 "$API_URL/playback/now-playing")
    [ -z "$song_info" ] && { echo "No song info"; return; }

    # 4. Parse and print
    if command -v jq >/dev/null 2>&1; then
        artist=$(jq -r '.info.artistName // "Unknown Artist"' <<<"$song_info")
        title=$(jq -r '.info.name        // "Unknown Song"'  <<<"$song_info")
    else
        artist=$(grep -o '"artistName":"[^"]*"' <<<"$song_info" | sed 's/.*:"\(.*\)"/\1/')
        title=$(grep -o '"name":"[^"]*"'        <<<"$song_info" | sed 's/.*:"\(.*\)"/\1/' | head -1)
        [ -z "$artist" ] && artist="Unknown Artist"
        [ -z "$title"  ] && title="Unknown Song"
    fi
    printf '%s - %s\n' "$artist" "$title"
}

# Loop or single-shot
[ "$1" = "--loop" ] \
    && while :; do get_current_song; sleep 2; done \
    || get_current_song
