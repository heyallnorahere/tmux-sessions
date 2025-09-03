#!/bin/zsh

LOCKFILE=$1
shift

START=$(date +%s)
while ($(stat $LOCKFILE -c "%Y") < $START); do
    sleep 0.1
done
