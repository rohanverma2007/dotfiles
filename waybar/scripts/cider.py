#!/usr/bin/env python3

import requests
import json
import time
import sys

def get_current_song():
    """Get currently playing song from Cider API"""
    try:
        # Check if Cider is playing
        playing_response = requests.get("http://localhost:10767/api/v1/playback/is-playing", timeout=2)
        if playing_response.status_code != 200:
            return "Cider not responding"
        
        is_playing = playing_response.json()
        if not is_playing:
            return "Not playing"
        
        # Get current song info
        song_response = requests.get("http://localhost:10767/api/v1/playback/now-playing", timeout=2)
        if song_response.status_code != 200:
            return "No song info"
        
        song_data = song_response.json()
        
        # Extract artist and song name
        # The response is an Apple Music API response
        attributes = song_data.get('attributes', {})
        artist_name = attributes.get('artistName', 'Unknown Artist')
        song_name = attributes.get('name', 'Unknown Song')
        
        return f"{artist_name} - {song_name}"
        
    except requests.exceptions.ConnectionError:
        return "Cider not running"
    except requests.exceptions.Timeout:
        return "Cider timeout"
    except json.JSONDecodeError:
        return "Invalid response"
    except KeyError:
        return "Invalid song data"
    except Exception as e:
        return f"Error: {str(e)}"

def main():
    """Main function for waybar integration"""
    if len(sys.argv) > 1 and sys.argv[1] == "--loop":
        # Continuous mode for waybar
        while True:
            print(get_current_song(), flush=True)
            time.sleep(2)  # Update every 2 seconds
    else:
        # Single execution mode
        print(get_current_song())

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        sys.exit(0)
