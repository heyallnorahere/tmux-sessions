#!/bin/zsh

DIR=$(realpath $(dirname $0))
$DIR/wait-for-lock.zsh ~/.layout

cava -p $(realpath "$DIR/../cava-config")
