#!/bin/bash
set -e
echo "***** Reading Push *****"
REPOSITORY="sergimp/jenkis"
IMAGE_LOCAL="maven-project"
BUILD_TAG="${BUILD_TAG:-latest}"
echo "***** Logging in *****"
echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
echo "***** Tagging image *****"
docker tag "$IMAGE_LOCAL:$BUILD_TAG" "$REPOSITORY:$BUILD_TAG"
echo "***** Pushing image *****"
docker push "$REPOSITORY:$BUILD_TAG"