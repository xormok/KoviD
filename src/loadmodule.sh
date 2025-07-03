#!/bin/bash
insmod=$(which insmod)
output=$(strace kill -CONT 501 2>&1 | grep "kill(501, SIGCONT)" | awk '{ print $4 }')
if [[ $? -ne 0 || "$output" != "22" ]]; then
    $insmod "$1" >/dev/null 2>&1
fi
