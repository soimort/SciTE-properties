#!/bin/sh

cd properties/
for p in ../patches/*.patch
do
    patch < $p
done
# invert RGB
for FILE in *.properties; do
    if [ -r $FILE ]; then
        echo "inverting colors for $FILE..."
        awk -f ../rgb-invert.awk $FILE > $FILE.tmp
        mv -f $FILE.tmp $FILE
    fi
done
