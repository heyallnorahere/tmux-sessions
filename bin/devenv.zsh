#!/bin/zsh

if [ -z $1 ]; then
    SESSIONNAME="devenv"
else
    SESSIONNAME=$1
fi

if ! tmux has-session -t $SESSIONNAME &> /dev/null; then
    BINDIR=$(realpath $(dirname $0))

    tmux new-session -c "$HOME/src" -s $SESSIONNAME zsh "$BINDIR/setup-devenv.zsh"
else
    tmux attach -t $SESSIONNAME
fi
