# Minecraft Server Setup Guide

## Setup Instructions

### Step 1: Configure the `setup.sh` Script
1. Open the `setup.sh` file:

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

### Step 3: Set Up ip stuff
1. open a new terminal page
2. If the script successfully configured `ngrok`, you’re ready to use it.
3. To manually verify or reconfigure `ngrok`, run:
   ```bash
   ngrok config add-authtoken your-ngrok-authtoken
   ```
4. Run the `ip.sh` script:
   ```bash
   ./ip.sh
   ```

5. Follow the on-screen instructions to link your `playit.gg` account and set up a tunnel for your Minecraft server.

---

### Step 5: Start the Minecraft Server
1. go back to the original terminal page
2. Run the `start.sh` script to start the Minecraft server:
   ```bash
   ./start.sh
   ```
3. Use the `ip.sh` script to retrieve the IP addresses for connecting to the server:
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

Enjoy your Minecraft server!