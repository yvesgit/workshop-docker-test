#!/bin/sh
CURRENTDIR=$(dirname $0)
PARENT=$(realpath $CURRENTDIR/..)
NAME=$(basename $PARENT)

echo "Searching for $NAME"
CONTAINER=`docker container inspect $NAME -f '{{.State.Status}} {{.Config.Image}}'`
if [ "$?" -eq 0 ]; then
    echo "$CONTAINER found running already"
    docker exec -it $NAME /bin/sh
else
    echo "$NAME not running already"
    $(dirname $0)/run-development.sh /bin/sh
fi
