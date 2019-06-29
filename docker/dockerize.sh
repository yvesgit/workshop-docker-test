#!/bin/sh
CURRENTDIR=$(dirname $0)
PARENT=$(realpath $CURRENTDIR/..)
NAME=$(basename $PARENT)
. $CURRENTDIR/.env

echo "Building docker container $ORGANIZATION/$NAME"
docker build \
    -t $ORGANIZATION/$NAME \
    -t $ORGANIZATION/$NAME:`date +%Y-%m-%d` \
    -t $ORGANIZATION/$NAME:latest \
    -f $PARENT/docker/Dockerfile \
    $PARENT
