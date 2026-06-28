#!/bin/bash
set -e

source /home/sergi/deploy/.env

echo "Descargando imagen: $IMAGE:$BUILD_TAG"

docker pull "$IMAGE:$BUILD_TAG"
