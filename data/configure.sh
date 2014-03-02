#!/bin/sh

# https://khms0.google.co.uk/kh/v=145&src=app&x=65284&s=&y=43456&z=17&scale=2&s=Gali

# https://khms0.google.co.uk/kh/v=145&src=app&x=65636&s=&y=43666&z=17&scale=2&s=Galile

# zones 1-2 central london
#export ZOOM=17
#export YFROM=43560
#export YTO=43610
#export XFROM=65427
#export XTO=65550

# whole tube map inc metropolitan line
export ZOOM=17
export YFROM=43456
export YTO=43666
export XFROM=65284
export XTO=65636

# make tiles folder if required
export TILE_FOLDER=tiles$ZOOM
[ -d tiles$ZOOM ] || mkdir tiles$ZOOM

# generate a list of "x y" coordinate lines in row major order
build_xy_list() {
	for y in $(seq $YFROM $YTO)
	do
		for x in $(seq $XFROM $XTO)
		do
			echo $x $y
		done
	done
}


conf_info() {
    echo "Tile count: $(( ($XTO - $XFROM + 1) * ($YTO - $YFROM + 1) ))"
    echo "Tiles: $(($XTO - $XFROM + 1)) x $(($YTO - $YFROM + 1))"
    echo "Pixels: $((($XTO - $XFROM) * 256)) x $((($YTO - $YFROM) * 256))"
    echo "Cm @ 300dpi: $((($XTO - $XFROM) * 2)) x $((($YTO - $YFROM) * 2))"
}