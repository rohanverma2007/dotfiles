#!/bin/bash

# Audio Services Startup Script for Sway
# This script starts PipeWire, WirePlumber, pipewire-pulse, and blueman-applet
# in the correct order with proper user session environment

# Set up environment variables for audio services
export XDG_RUNTIME_DIR="/tmp/1000-runtime"
export PULSE_RUNTIME_PATH="${XDG_RUNTIME_DIR}/pulse"
export PIPEWIRE_RUNTIME_DIR="${XDG_RUNTIME_DIR}"

# Function to log messages with timestamp
log_message() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

log_message "Starting audio services initialization..."

# Kill any existing audio processes to ensure clean start
log_message "Cleaning up existing audio processes..."
pkill -f pipewire-pulse 2>/dev/null || true
pkill -f wireplumber 2>/dev/null || true
pkill -f pipewire 2>/dev/null || true
pkill -f blueman-applet 2>/dev/null || true

# Wait for processes to fully terminate
sleep 2

# Ensure runtime directory exists
mkdir -p "${XDG_RUNTIME_DIR}" 2>/dev/null || true

# Start PipeWire first (core audio server)
log_message "Starting PipeWire..."
pipewire &
PIPEWIRE_PID=$!
log_message "PipeWire started with PID: $PIPEWIRE_PID"

# Wait for PipeWire to initialize
sleep 3

# Start WirePlumber (session manager)
log_message "Starting WirePlumber..."
wireplumber &
WIREPLUMBER_PID=$!
log_message "WirePlumber started with PID: $WIREPLUMBER_PID"

# Wait for WirePlumber to initialize and discover devices
sleep 4

# Start pipewire-pulse (PulseAudio compatibility)
log_message "Starting pipewire-pulse..."
pipewire-pulse &
PULSE_PID=$!
log_message "pipewire-pulse started with PID: $PULSE_PID"

# Wait for pulse to initialize
sleep 3

# Start blueman-applet (Bluetooth manager GUI)
log_message "Starting blueman-applet..."
blueman-applet &
BLUEMAN_PID=$!
log_message "blueman-applet started with PID: $BLUEMAN_PID"

log_message "All audio services started successfully!"
log_message "PipeWire: $PIPEWIRE_PID, WirePlumber: $WIREPLUMBER_PID, pipewire-pulse: $PULSE_PID, blueman-applet: $BLUEMAN_PID"

# Reload USB audio module to ensure proper device detection
log_message "Reloading USB audio module for device stability..."
doas modprobe -r snd-usb-audio
sleep 2
doas modprobe snd-usb-audio
log_message "USB audio module reloaded successfully"

# Keep the script running so Sway doesn't think it failed
# This prevents Sway from trying to restart the services
wait
