#!/bin/zsh

DIR=$(realpath $(dirname $0))

tmux bind-key v select-pane -t 0
tmux bind-key a select-pane -t 2

# cmatrix
tmux split-window -v "$DIR/cmatrix.zsh"

# shell
tmux split-window -v "$DIR/shell.zsh"

# cava
tmux split-window -v "$DIR/cava.zsh"

# use vertical layout
# main shell is on the left
# all others are on the right
tmux select-layout main-vertical

tmux select-pane -t 0
echo "layout set" > ~/.layout

sleep 0.2
nvim

# kill the session when this shell exits
tmux kill-session
