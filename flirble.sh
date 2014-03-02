#!/bin/sh

#
# Live reloading development tool. Launch "go-go-gadget.sh" and this script
# will be run and then re-run every time a source file changes.
#

clear

echo "Running flirble.sh at `date`"

pypy process.py out.rgb

convert -size 256X256 -depth 8 out.rgb out.png

echo "Finished running flirble.sh"