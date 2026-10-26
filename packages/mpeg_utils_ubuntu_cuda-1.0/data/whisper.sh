#!/bin/bash

filename="$1"
bname=`basename -s .mp4 "$filename"`

# Extract the audio from the video file
ffmpeg -i "$1" "$bname.m4a"

# Generate the .srt file using the extracted audio
whisper "$bname.m4a" --device cuda --model base --language English --output_format srt  --verbose True

# convert the .srt file to .ttml
tt convert -i "$filename".srt -o "$filename".ttml