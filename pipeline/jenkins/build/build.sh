
#!/bin/bash
set -e

echo "****************************"
echo "** Copying JAR *************"
echo "****************************"

cp -f my-app-1.0-SNAPSHOT.jar app.jar

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"


docker compose -f docker-compose.yml build --no-cache

