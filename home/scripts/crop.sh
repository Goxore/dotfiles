#!/bin/bash 

file=$1
start=$2
[ "$2" == "0" ] && start="00:00:00"
end="00:$3"

ffmpeg -i "$file" -vn -y -acodec copy -ss $start -t $end "tempoutput.mp3"
rm "./$file"
mv tempoutput.mp3 "$file"
