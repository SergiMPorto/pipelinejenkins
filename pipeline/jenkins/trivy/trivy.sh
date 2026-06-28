#!/bin/bash
echo "***************************"
echo "** Trivy Scan ******"
echo "***************************"

$HOME/bin/trivy image \
  --format json \
  --output ${WORKSPACE}/trivy-report.json \
  --severity HIGH,CRITICAL \
  maven-project:$BUILD_TAG