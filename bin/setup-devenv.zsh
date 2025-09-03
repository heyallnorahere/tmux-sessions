#!/bin/zsh

DIR=$(realpath $(dirname $0))

# cmatrix
tmux split-window -v "$DIR/cmatrix.zsh"

# nvim
tmux split-window -v nvim

# cava
tmux split-window -v "$DIR/cava.zsh"

# use vertical layout
# main shell is on the left
# all others are on the right
tmux select-layout main-vertical

tmux select-pane -t 0
echo "layout set" > ~/.layout

sleep 0.2

# run the damn shell
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
$SHELL

# kill the session when this shell exits
tmux kill-session
