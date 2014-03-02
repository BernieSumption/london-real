#!/bin/sh

source configure.sh

build_xy_list | parallel --colsep ' ' ./download-single.sh {1} {2} $ZOOM
