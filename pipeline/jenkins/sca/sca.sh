#!/bin/bash
echo "***************************"
echo "** Dependency Check ******"
echo "***************************"

mkdir -p ${WORKSPACE}/reports
chmod 777 ${WORKSPACE}/reports

docker run --rm \
  --user 1000:1000 \
  -v ${WORKSPACE}:/src \
  -v ${WORKSPACE}/reports:/report \
  -v dependency-check-data:/usr/share/dependency-check/data \
  owasp/dependency-check:latest \
  --scan /src \
  --out /report \
  --format ALL \
  --project "java-app" \
  --nvdApiKey 55585976-4dab-4c96-9ca1-92aec1d494b3