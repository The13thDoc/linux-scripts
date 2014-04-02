#!/bin/bash
shopt -s globstar

#=========
# Searching through the music library folder, find, list, and record
# each file by type (flac, mp3, ogg, etc.). See actual code for
# for extensions used.
#=========

# clear console
clear
# console out
echo 'Starting "search.sh"'

###
# Search for files by extension and folder path.
#
# Param:
#	$1 - Path to folder
#	$2 - extension (ex: "flac")
###
function find-ext {
	count=0

	# console
	echo 'Searching for "'$2'" files...'
	# log
	echo 'Searching for "'$2'" files...' >> search.log
	echo '' >> search.log # \n

	# clear ext-specific log file
	echo '' > "$2.log"

	for file in $1/**/*.$2;
	do
		if [ -f "$file" ]
		then
			echo $file >> search.log
			echo $file >> "$2.log"

			(( count = count + 1 ))
		fi

		echo '' >> search.log # \n
		echo '' >> "$2.log"

	done
	
	# output total files found
	echo '"'$2'" Files found: ' $count >> search.log
	echo '"'$2'" Files found: ' $count >> "$2.log"
	echo '' >> search.log # \n
	echo '' >> "$2.log" # \n
	echo 'Finished searching for "'$2'".' >> search.log
	echo '==============================' >> search.log
	echo '' >> search.log # \n
	echo '' >> search.log # \n

	# console
	echo 'Finished searching for "'$2'".'

}

###
# Search for duplicate file names within a folder.
# (ex: "01 Song.mp3" and "01 Song.flac")
#
# THIS DOES NOT WORK YET
#
# Param:
#	$1 - Path to folder
###
function find-duplicates {
	path=$1

	# console
	echo 'Searching for duplicates...'
	# log
	echo 'Searching for duplicates...' >> search.log
	echo '' >> search.log # \n
	
	for file in $path/**/*;
	do
		echo ${file%%.*} >> search.log
	done
	
	echo '==============================' >> search.log
	echo '' >> search.log # \n
	echo '' >> search.log # \n
}

#=========
# Main
#=========

# Path of the Music folder
path='/media/HDD-Internal/Music'

# clear log here...
echo 'Start "search.sh". Clearing log file.' > search.log
echo '' >> search.log # \n

find-ext $path "flac"
find-ext $path "wma"
find-ext $path "wav"
find-ext $path "mp3"
find-ext $path "ogg"

#find-duplicates $path

# console out
echo '"search.sh" is finished.'
