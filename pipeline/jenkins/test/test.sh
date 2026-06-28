#!/bin/bash
set -e
echo "***************************"
echo "** Testing the code ******"
echo "***************************"

mvn -f $WORKSPACE/java-app/pom.xml test
