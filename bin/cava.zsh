#!/bin/zsh

DIR=$(realpath $(dirname $0))
CONFIG_DIR=$(realpath "$DIR/../config")

$DIR/wait-for-lock.zsh ~/.layout

cava -p "$CONFIG_DIR/cava"
