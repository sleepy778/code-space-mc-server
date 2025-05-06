#!/bin/bash
set -e

JAVA_OPTS="-Xms2G -Xmx6G"
JAR="paper.jar"

if [ ! -f "$JAR" ]; then
  echo "Paper jar not found! Run ./setup.sh first."
  exit 1
fi

# Accept EULA automatically
echo "eula=true" > eula.txt

# Start server
java $JAVA_OPTS -jar $JAR nogui
