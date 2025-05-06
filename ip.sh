#!/bin/bash

# Kill previous session if it exists (ignore errors)
tmux kill-session -t session 2>/dev/null

# Create a new, detached session named "session"
tmux new-session -d -s session

# Split the window vertically (creates pane 0.1)
tmux split-window -v -t session:0

# Send commands to each pane
tmux send-keys -t session:0.0 './playit' C-m
tmux send-keys -t session:0.1 'ngrok tcp 25565' C-m

# Attach to the session
tmux attach-session -t session