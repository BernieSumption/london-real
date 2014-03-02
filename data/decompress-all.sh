#!/bin/sh

#
# Uncompress and rename images
#

source configure.sh

[ -d tiles${ZOOM}rgb ] || mkdir tiles${ZOOM}rgb

build_xy_list | parallel --colsep ' ' ./decompress-single.sh {1} {2} $ZOOM


