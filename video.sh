#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null
then
    echo "ffmpeg is not installed. Please install ffmpeg and try again."
    exit
fi

# Check if the input file exists
input_file="report1.mov"
if [ ! -f "$input_file" ]
then
    echo "Input file '$input_file' not found."
    exit
fi

# Set output file name
output_file="output.gif"

# Set options for GIF conversion
fps=10  # Adjust the frame rate as needed
scale=2160ou:-1  # Adjust the width to 640 pixels while maintaining aspect ratio
bitrate=0  # Set bitrate to 0 to disable video compression (lossless)

# Convert .mov to .gif
ffmpeg -i "$input_file" -vf "fps=$fps,scale=$scale:flags=lanczos" -b:v $bitrate "$output_file"

echo "Conversion complete. GIF saved as $output_file"
