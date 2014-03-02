#!/bin/sh

#
# Uncompress a single image
#


source configure.sh

x=$1
y=$2
ZOOM=$3
JPEGFILE=tiles$ZOOM/$x-$y.jpg

RGBFILE=tiles${ZOOM}rgb/$(($x - $XFROM))-$(($y - $YFROM)).rgb

stream -map rgb -storage-type char $JPEGFILE $RGBFILE

echo "decompressed tile $x $y - $(( (y - $YFROM) * 100 / ( $YTO  - $YFROM) ))% complete"