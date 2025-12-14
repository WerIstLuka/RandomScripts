#!/bin/Python3

#put each song lyric into its own file
#first install lyricsgenius
#then run this command to download lyrics: python3 -m lyricsgenius artist "ARTIST" --format txt --save -t TOKEN

#run this script with the lyrics file as input: python3 lyrics.py saved_artist_lyrics_whitey_182_songs.txt

import re
import os
import sys



if len(sys.argv) < 2:
	Input = input("enter the filename: ")
else:
	Input = "".join(sys.argv[1:])

with open(Input, "r") as file:
    lines = file.readlines()

if not os.path.isdir("songs"):
    os.mkdir("songs")

SongName = ""
FileIsOpen = False
for line in lines:
    if line[0:5] == "[Song":
        if FileIsOpen:
            out.close()
        SongName = re.search("(?<=: ).+(?=])", line)[0]
        SongName = SongName.replace("/", " ")
        out = open(f"songs/{SongName}.txt", "w")
        FileIsOpen = True
    else:
        out.write(line)
