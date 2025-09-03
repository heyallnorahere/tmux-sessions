#!/bin/zsh

DIR=$(realpath $(dirname $0))
$DIR/wait-for-lock.zsh ~/.layout

run_cmatrix() {
    CMATRIX_DIR="$HOME/src/cmatrix"
    echo "cmatrix source directory: $CMATRIX_DIR"

    if [[ -d $CMATRIX_DIR ]]; then
        cd $CMATRIX_DIR
        git checkout master
        git pull
    else
        git clone https://github.com/abishekvashok/cmatrix.git $CMATRIX_DIR
    fi

    cd $CMATRIX_DIR
    if ! cmake . -B build; then
        exit 1
    fi

    if ! cmake --build build -j 8; then
        exit 1
    fi

    build/cmatrix -C red
}

run_cmatrix
tmux kill-session
