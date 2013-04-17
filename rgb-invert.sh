#!/bin/sh
# Sample:
#    sudo ./rgb-invert.sh /usr/share/scite/*.properties
for FILE; do
    if [ -r $FILE ]; then
        echo "Processing $FILE..."
        awk -f rgb-invert.awk $FILE > $FILE.tmp
        mv -f $FILE.tmp $FILE
    fi
done
