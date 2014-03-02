#!/bin/sh

#
# OH FRABJOUS DAY, CALHOO CALHAY!
#

./flirble.sh

watchmedo shell-command \
    --patterns="*.py;*.sh" \
    --recursive \
    --command=./flirble.sh
