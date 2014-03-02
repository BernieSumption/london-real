

x=$1
y=$2
ZOOM=$3
FILE=tiles$ZOOM/$x-$y.jpg

[ -f $FILE ] || curl --silent --output $FILE "http://khms1.google.co.uk/kh/v=145&src=app&x=$x&s=&y=$y&z=$ZOOM"

echo "tile $x $y - $(( (y - $YFROM) * 100 / ( $YTO  - $YFROM) ))% complete"