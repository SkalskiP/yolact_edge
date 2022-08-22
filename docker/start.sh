#!/bin/bash

SOURCE_CODE=$1
DATASETS=$2

#docker run --gpus all -it --name=yolact_edge \
#  --shm-size=8gb --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
#  -v $SOURCE_CODE:/yolact_edge/:rw \
#  -v $DATASETS:/datasets/:ro \
#  yolact_edge_image


xhost +
sudo docker run -it --rm --net=host \
    --shm-size=8gb \
    --runtime nvidia \
    --device /dev/video0:/dev/video0:mrw \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -v $SOURCE_CODE:/yolact_edge/:rw \
    -v $DATASETS:/datasets/:ro \
    yolact_edge_image
