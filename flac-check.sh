#!/bin/bash
shopt -s globstar

##==
# Finds all FLAC files in the Music directory and tests their validity.
# NOTE: This code was found somewhere in the Ubuntu forums. 
# Exact link is unknown. It has been modified to suit my needs.
##==

# /media/Elements/Music/Metallica
# ./**/*.flac
for file in ./**/*.flac; do
	echo $file
    flac -wst "$file" 2>/dev/null || printf '%3d %s\n' "$?" "$file" >> status.txt
done
