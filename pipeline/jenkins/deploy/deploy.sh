#!/bin/bash

set -e

REMOTE_USER="sergi"
REMOTE_HOST="192.168.1.91"
REMOTE_DIR="/home/sergi/deploy"

IMAGE="sergimp/jenkis"
BUILD_TAG="${BUILD_TAG:-latest}"

echo "+++++++++Creating remote directory+++++++++++++"
ssh -i $SSH_KEY -o StrictHostKeyChecking=no "$REMOTE_USER@$REMOTE_HOST" "mkdir -p $REMOTE_DIR"

echo "++++++++++++++++++ Creating .env +++++++++++++++++"
cat > .env <<EOF
IMAGE=$IMAGE
BUILD_TAG=$BUILD_TAG
EOF

echo "+++++++++++++++Copying files to remote machine+++++++++++++"
scp -i $SSH_KEY -o StrictHostKeyChecking=no .env publish.sh "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/"

echo "++++++++++++Executing remote publish script ++++++++++"
ssh -i $SSH_KEY -o StrictHostKeyChecking=no "$REMOTE_USER@$REMOTE_HOST" "
chmod +x $REMOTE_DIR/publish.sh &&
bash $REMOTE_DIR/publish.sh
"

echo "+++++++++++++++++++Deployment Finished+++++++++++++++++++"