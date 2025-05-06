# Minecraft Server Setup Guide

This guide explains how to set up a Minecraft server using the provided `setup.sh` script. It also includes instructions for configuring `ngrok` and `playit.gg` to expose your server to the internet.

---

## Prerequisites

Before starting, ensure you have the following installed on your system:
1. **Bash Shell** (default on Linux and macOS, installable on Windows via WSL or Git Bash).
2. **`curl`**: Used for downloading files.
3. **`jq`**: A lightweight JSON processor.
   - Install it using:
     ```bash
     sudo apt-get install jq -y  # For Debian/Ubuntu
     ```
4. **`ngrok`**: A tunneling service to expose your local server to the internet.
   - Download it from [ngrok's website](https://ngrok.com/download).
5. **`playit.gg`**: Another tunneling service for Minecraft servers.
   - Download the `playit` binary from [playit.gg](https://playit.gg/download).

---

## Setup Instructions

### Step 1: Configure the `setup.sh` Script
1. Open the `setup.sh` file in a text editor:
   ```bash
   nano setup.sh
   ```
2. Replace the placeholder `AUTHTOKEN` value with your actual `ngrok` authtoken:
   ```bash
   AUTHTOKEN="your-ngrok-authtoken"
   ```
   - You can find your `ngrok` authtoken by logging into your [ngrok dashboard](https://dashboard.ngrok.com/get-started/your-authtoken).

3. Save and close the file.

---

### Step 2: Run the Setup Script
1. Make the `setup.sh` script executable:
   ```bash
   chmod +x setup.sh
   ```
2. Run the script:
   ```bash
   ./setup.sh
   ```
   - The script will:
     - Fetch the latest build of PaperMC for Minecraft version `1.21.4`.
     - Download the `paper.jar` file.
     - Set up permissions for various scripts.
     - Configure `ngrok` with your authtoken.

---

### Step 3: Set Up `ngrok`
1. If the script successfully configured `ngrok`, you’re ready to use it.
2. To manually verify or reconfigure `ngrok`, run:
   ```bash
   ngrok config add-authtoken your-ngrok-authtoken
   ```
3. Start a tunnel for your Minecraft server:
   ```bash
   ngrok tcp 25565
   ```
   - This will expose your Minecraft server on a public IP and port provided by `ngrok`.

---

### Step 4: Set Up `playit.gg`
1. Download the `playit` binary from [playit.gg](https://playit.gg/download).
2. Make the binary executable:
   ```bash
   chmod +x playit
   ```
3. Run the `playit` binary:
   ```bash
   ./playit
   ```
4. Follow the on-screen instructions to link your `playit.gg` account and set up a tunnel for your Minecraft server.

---

### Step 5: Start the Minecraft Server
1. Run the `start.sh` script to start the Minecraft server:
   ```bash
   ./start.sh
   ```
2. Use the `ip.sh` script to retrieve the IP addresses for connecting to the server:
   ```bash
   ./ip.sh
   ```
   - The script will display:
     - **Bedrock IP and Port** (for Bedrock Edition players).
     - **Java IP and Port** (for Java Edition players).

---

### Step 6: Save Your Progress
1. Use the `save.sh` script to save the server state and any changes made:
   ```bash
   ./save.sh
   ```

---

## Troubleshooting

- **`ngrok` or `playit` not working?**
  - Ensure the binaries are executable (`chmod +x`).
  - Verify your internet connection.
  - Check the logs for errors.
- **Server not starting?**
  - Ensure `paper.jar` was downloaded correctly.
  - Check the `start.sh` script for errors.

---

## Additional Notes

- The `setup.sh` script automates most of the setup process, but you can manually configure `ngrok` and `playit.gg` if needed.
- Share the public IP and port (from `ngrok` or `playit.gg`) with your friends to allow them to connect to your server.

Enjoy your Minecraft server!