#!/bin/bash

# Setup Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

clear

# Animated Red TheRynzo Banner
echo -e "${RED}"
cat << "EOF" | while read -r line; do echo "$line"; sleep 0.1; done
  _______ _          _____                        
 |__   __| |        |  __ \                       
    | |  | |__   ___| |__) |   _ _ __  _______  
    | |  | '_ \ / _ \  _  / | | | '_ \|__  / _ \ 
    | |  | | | |  __/ | \ \ |_| | | | | / / (_) |
    |_|  |_| |_|\___|_|  \_\__,_|_| |_|/___|\___/ 
EOF
echo -e "${NC}"

# Animated Subtitle
SUBTITLE="Powered By TheRynzo"
echo -e "${RED}"
for (( i=0; i<${#SUBTITLE}; i++ )); do
    echo -n "${SUBTITLE:$i:1}"
    sleep 0.05
done
echo -e "${NC}\n"

# UI Header
echo -e "${RED}================================================================${NC}"
echo -e "${WHITE}  APOLLO THEME INSTALLER${NC}"
echo -e "${RED}================================================================${NC}\n"

# License Key Verification
read -p "$(echo -e ${RED}"➤ Enter License Key: "${NC})" LICENSE_KEY

if [ "$LICENSE_KEY" != "ptero.rynzo.eu.cc" ]; then
    echo -e "\n${RED}✗ Invalid License Key! Access Denied.${NC}"
    exit 1
fi

echo -e "\n${GREEN}✓ License Verified! Proceeding with installation...${NC}\n"
sleep 1

# Navigate to Pterodactyl directory (required for theme installations)
echo -e "${RED}➤${NC} ${WHITE}Locating Pterodactyl panel directory...${NC}"
cd /var/www/pterodactyl || { echo -e "${RED}✗ Error: /var/www/pterodactyl not found! Is the panel installed?${NC}"; exit 1; }

# Download the Installer from your GitHub Repo
echo -e "${RED}➤${NC} ${WHITE}Downloading Apollo Installer (AMD64)...${NC}"
# Note: Assuming your repository uses the 'main' branch.
curl -sLo apolloInstallerAmd64 https://raw.githubusercontent.com/therynzo/Test/main/apolloInstallerAmd64

# Verify download was successful
if [ ! -s "apolloInstallerAmd64" ]; then
    echo -e "${RED}✗ Error: Failed to download the file. Please check if it exists in your GitHub repo.${NC}"
    exit 1
fi

# Set Execution Permissions
echo -e "${RED}➤${NC} ${WHITE}Granting execution permissions...${NC}"
sudo chmod +x apolloInstallerAmd64

# Execute the Installer
echo -e "${RED}➤${NC} ${WHITE}Launching Apollo Installer...${NC}\n"
echo -e "${RED}================================================================${NC}"
sleep 1

sudo ./apolloInstallerAmd64
