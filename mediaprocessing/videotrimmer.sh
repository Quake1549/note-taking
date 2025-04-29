#!/bin/bash

# Check if yt-dlp and ffmpeg are installed
if ! command -v yt-dlp &>/dev/null || ! command -v ffmpeg &>/dev/null; then
    echo "Error: yt-dlp and/or ffmpeg are not installed."
    echo "Install them using:"
    echo "  brew install yt-dlp ffmpeg"
    exit 1
fi

# Ask for YouTube URL
read -p "Enter the YouTube video URL: " VIDEO_URL

# Download video in MP4 format
echo "Downloading video..."
yt-dlp -f 'bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]' --merge-output-format mp4 -o "video.mp4" "$VIDEO_URL"

# Check if download was successful
if [ ! -f "video.mp4" ]; then
    echo "Error: Failed to download the video."
    exit 1
fi

# Ask for start and end time
read -p "Enter start time (HH:MM:SS): " START_TIME
read -p "Enter end time (HH:MM:SS): " END_TIME

# Trim the video without re-encoding
echo "Extracting the requested clip..."
ffmpeg -i video.mp4 -ss "$START_TIME" -to "$END_TIME" -c copy output.mp4

# Cleanup
rm video.mp4

echo "Trimmed video saved as output.mp4"