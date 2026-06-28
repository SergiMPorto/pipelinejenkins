#!/bin/bash 
cd $WORKSPACE/java-app
echo "***************************"
echo "** Running SonarQube *****"
echo "***************************"  

mvn sonar:sonar \
    -Dsonar.projectKey=java-app \
    -Dsonar.host.url=http://172.25.167.210:9000

