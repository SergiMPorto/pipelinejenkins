#!/bin/bash

echo "***************************"
echo "** Building jar ***********"
echo "***************************"

docker run --rm \
  -v $HOST_WORKSPACE/java-app:/app \
  -v /root/.m2:/root/.m2 \
  -w /app \
  maven:3.9.9-eclipse-temurin-21 \
  mvn clean package -DskipTests
