#!/bin/sh
# Sample:
#    ./extract_properties.sh scite-3.3.1-1-x86_64.pkg.tar.xz

if [[ "$@" = "" ]]; then echo 'Usage: extract_properties.sh scite*.tar.xz'; exit 0; fi

mkdir -p _temp
rm -fr properties/*

cd _temp/
tar xvf ../$@
cp usr/share/scite/*.properties ../properties
cd ..

rm -fr _temp/
