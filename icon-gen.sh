#!/bin/bash

if [ "$1" == "" ]; then
	read -r -p "enter icon name: " IconName
else
	IconName=$1
fi

test -f "$IconName" || ( echo "file $IconName doesnt exist" && exit )

Output=$(echo "$IconName" | cut -f1 -d'.')

echo "$IconName"
echo "$Output"

for Size in 16 22 24 32 44 48 64 96 128 192 256 512; do
	mkdir $Size
	inkscape "$IconName" --export-width="$Size" --export-filename="$Size/$Output.png"
done

mkdir 16@2x 22@2x 24@2x 32@2x 48@2x 64@2x 96@2x 256@2x

cp 32/*  16@2x
cp 44/*  22@2x;  rm -rf 44
cp 48/*  24@2x
cp 64/*  32@2x
cp 96/*  48@2x
cp 128/* 64@2x;  rm -rf 128
cp 192/* 96@2x;  rm -rf 192
cp 512/* 256@2x; rm -rf 512
