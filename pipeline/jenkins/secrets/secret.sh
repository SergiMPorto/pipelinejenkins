#!/bin/bash
echo "***************************"
echo "** Gitleaks Scan ******"
echo "***************************"

docker run --rm \
  -v ${HOST_WORKSPACE}:/path \
  zricethezav/gitleaks:latest \
  detect \
  --source /path \
  --no-git \
  --report-path /path/gitleaks-report.json || true