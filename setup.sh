#!/bin/bash
set -e

AUTHTOKEN="put ur ngrok authtoken here"
if [ -z "$AUTHTOKEN" ]; then
  echo "Please set your ngrok authtoken in the script."
  echo "You can get it from https://dashboard.ngrok.com/get-started/your-authtoken"
  exit 1
fi
PAPER_VERSION="1.21.4"

# Get the latest build number for PaperMC 1.21.4
BUILD=$(curl -s https://api.papermc.io/v2/projects/paper/versions/$PAPER_VERSION | jq -r ".builds[-1]")

if [ -z "$BUILD" ] || [ "$BUILD" == "null" ]; then
  echo "Could not fetch build info for Paper $PAPER_VERSION."
  exit 1
fi

echo "Latest build for Paper $PAPER_VERSION: $BUILD"

# Download the Paper jar
curl -L -o paper.jar "https://api.papermc.io/v2/projects/paper/versions/$PAPER_VERSION/builds/$BUILD/downloads/paper-$PAPER_VERSION-$BUILD.jar"

echo "Downloaded paper.jar"

sudo apt update
sudo apt install tmux
sudo apt install default-jdk

chmod +x playit
chmod +x ngrok.tgz
chmod +x setup.sh
chmod +x start.sh
chmod +x ip.sh
chmod +x save.sh

echo "Gave Permission to scripts"

echo "Setting up ngrok token..."
ngrok config add-authtoken $AUTHTOKEN
echo "Ngrok token set up successfully."

echo "Setup complete. You can now run the server using ./start.sh" 
echo "run ./ip.sh  in a new terminal to get the IP addresses one on top is the bedrock ip and port and java is bottom."
echo "run ./save.sh to save the server and all changes made inside the codespace."
