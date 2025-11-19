#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: docker run <image> <image_url>"
    exit 1
fi

IMAGE_URL=$1

echo "Downloading image from $IMAGE_URL ..."
curl -L "$IMAGE_URL" -o input.jpg

cd /opt/darknet
./darknet detect cfg/yolov3.cfg yolov3.weights input.jpg -dont_show
