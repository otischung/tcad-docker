#!/bin/bash

docker run -it --rm \
    -v /home/lab512/workspace:/workspace \
    --hostname lab512 \
    --network host \
    lab512/tcad-docker:latest /bin/tcsh
