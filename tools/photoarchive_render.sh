#!/bin/sh

# wrapper script for the PhotoarchivePlugin

ANYTOPNM="/usr/bin/anytopnm"
PNMSCALE="/usr/bin/pnmscale"
PNMTOPNG="/usr/bin/pnmtopng"
PNMTOJPEG="/usr/bin/pnmtojpeg"
PNMPAD="/usr/bin/pnmpad"

srcimg="$1"
shift
outimg="$1"
shift
logfile="$1"
shift
pad="$1"
shift
scale="$*"

if test $pad = 0; then
   padcmd="cat"
else
   padcmd="$PNMPAD -white -width $pad -height $pad"
fi

echo " " >> $logfile
echo `date` >> $logfile
echo "$ANYTOPNM $srcimg 2>> $logfile | $PNMSCALE $scale | $padcmd | $PNMTOJPEG > $outimg" >> $logfile
exec  $ANYTOPNM $srcimg 2>> $logfile | $PNMSCALE $scale | $padcmd | $PNMTOJPEG > $outimg

