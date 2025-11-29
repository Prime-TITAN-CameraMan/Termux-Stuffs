#!/data/data/com.termux/files/usr/bin/bash

# Colour Definitions
BOLD_RED="\e[1;31m"
BOLD_YELLOW="\e[1;33m"
BOLD_CYAN="\e[1;36m"
BOLD_GREEN="\e[1;32m"
RESET="\e[0m"

echo -e "${BOLD_CYAN}Thanks for using TCM's script\nThe installation will be started shortly...${RESET}"
sleep 3 
clear

echo -e "${BOLD_YELLOW}Setting up few things...\nWill ask for user inputs!${RESET}"
sleep 2
pkg update > /dev/null 2>&1
pkg upgrade -y
pkg install -y wget > /dev/null 2>&1
cd ~
wget -O termux-fastest-repo https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Stuffs/refs/heads/main/bin/termux-fastest-repo > /dev/null 2>&1
chmod +x termux-fastest-repo
./termux-fastest-repo
echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2
clear
rm -rf /data/data/com.termux/files/home/termux-fastest-repo

echo -e "${BOLD_YELLOW}Updating & Upgrading All Packages...\nWill take few moments${RESET}"
pkg update
pkg upgrade -y
echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2
clear

echo -e "${BOLD_YELLOW}Installing Necessary Packages...\nUsually take few moments${RESET}"
pkg install -y x11-repo
pkg install -y termux-x11-nightly
pkg install -y tur-repo
pkg install -y termux-api
pkg install -y pulseaudio
pkg install -y proot-distro
pkg install -y rsync
pkg install -y python
echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2
clear

echo -e "${BOLD_YELLOW}Setting up Termux API Permissions...${RESET}"
clear
echo -e "${BOLD_RED}Give Microphone Permission to Termux API${RESET}"
sleep 1
termux-microphone-record -d 4
clear

echo -e "${BOLD_YELLOW}If you want to get other permissions on desktop then give it manually to Termux API app${RESET}"
sleep 2
clear

echo -e "${BOLD_YELLOW}Installing & Configuring HWA... (only for Vulkan-supported devices)${RESET}"
cd ~
mkdir Temp-HWA
cd ~/Temp-HWA
wget -O mesa-zink_23.0.4-5_aarch64.deb https://github.com/Prime-TITAN-CameraMan/Termux-Stuffs/raw/refs/heads/main/Packages/mesa-zink/mesa-zink_23.0.4-5_aarch64.deb
wget -O mesa-zink-dev_23.0.4-5_all.deb https://github.com/Prime-TITAN-CameraMan/Termux-Stuffs/raw/refs/heads/main/Packages/mesa-zink-dev/mesa-zink-dev_23.0.4-5_all.deb
apt install -y ./*.deb
apt install -y virglrenderer-mesa-zink vulkan-loader-generic angle-android virglrenderer-android libandroid-shmem libc++ libdrm libx11 libxcb libxshmfence libwayland zlib zstd
wget -O vulkan-icd.deb https://github.com/Prime-TITAN-CameraMan/Termux-Stuffs/releases/download/25.0.0-2/vulkan-wrapper-android_25.0.0-2_aarch64.deb
apt install -y ./vulkan-icd.deb
cd ~
rm -rf Temp-HWA
pkg install -y glmark2
pkg install -y vkmark
echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2
clear

echo -e "${BOLD_YELLOW}Browser Installation...\nUsually takes few minutes${RESET}"
sleep 2

while true; do  
  echo -e "${BOLD_CYAN}Select Your Browser:${RESET}"  
  echo -e "${BOLD_YELLOW}1) Firefox (recommended)${RESET}"  
  echo -e "${BOLD_YELLOW}2) Chromium (not recommended)${RESET}"  
  echo -e "${BOLD_YELLOW}3) Firefox and Chromium (both)${RESET}"  
  
  read -p "Enter your choice [1-3]: " choice  
  
  case $choice in  
    1)  
      echo -e "${BOLD_YELLOW}Installing Firefox...${RESET}"  
      pkg update > /dev/null 2>&1  
      pkg install -y firefox  
      echo -e "${BOLD_GREEN}Firefox Installed Successfully!${RESET}"  
      break  
      ;;  
    2)  
      echo -e "${BOLD_YELLOW}Installing Chromium...${RESET}"  
      pkg update > /dev/null 2>&1  
      pkg install -y chromium  
      echo -e "${BOLD_GREEN}Chromium Installed Successfully!${RESET}"  
      break  
      ;;  
    3)  
      echo -e "${BOLD_YELLOW}Installing Firefox and Chromium (both)${RESET}"  
      pkg update > /dev/null 2>&1  
      pkg install -y firefox  
      pkg install -y chromium  
      echo -e "${BOLD_GREEN}Firefox and Chromium Installed Successfully!${RESET}"  
      break  
      ;;  
    *)  
      echo -e "${BOLD_RED}Invalid option. Please try again.${RESET}"  
      ;;  
  esac  
done
echo -e "${BOLD_GREEN}Browser Installed Succesfully...${RESET}"
sleep 2
clear

echo -e "${BOLD_YELLOW}Installing a Video Player (works for audio as well)...\nUsually takes few minutes depends on internet speed${RESET}"
sleep 1
while true; do
  echo -e "${BOLD_CYAN}Select Your Player:${RESET}"
  echo -e "${BOLD_YELLOW}1) VLC (recommended, slightly higher on storage)${RESET}"
  echo -e "${BOLD_YELLOW}2) MPV (recommended, storage friendly)${RESET}"
  echo -e "${BOLD_YELLOW}3) VLC & MPV (both)${RESET}"
  echo -e "${BOLD_YELLOW}4) Skip${RESET}"

  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1)
      echo -e "${BOLD_YELLOW}Installing VLC...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y vlc-qt
      echo -e "${BOLD_GREEN}VLC Installed Successfully${RESET}"
      break
      ;;
    2)
      echo -e "${BOLD_YELLOW}Installing MPV...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y mpv
      echo -e "${BOLD_GREEN}MPV Installed Successfully${RESET}"
      break
      ;;
    3)
      echo -e "${BOLD_YELLOW}Installing VLC and MPV (both)...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y mpv
      pkg install -y vlc-qt
      echo -e "${BOLD_GREEN}VLC and MPV Installed Successfully!${RESET}"
      break
      ;;
    4)
      echo -e "${BOLD_YELLOW}Skipping Installation${RESET}"
      break
      ;;
    *)
      echo -e "${BOLD_RED}Invalid option. Please try again.${RESET}"
      ;;
  esac
done
echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2
clear

echo -e "${BOLD_YELLOW}Installing an IDE...\nUsually takes a while${RESET}"
sleep 1
while true; do
  echo -e "${BOLD_CYAN}Select Your IDE:${RESET}"
  echo -e "${BOLD_YELLOW}1) VS Code (code-oss)${RESET}"
  echo -e "${BOLD_YELLOW}2) Geany${RESET}"
  echo -e "${BOLD_YELLOW}3) VS Code and Geany (both)${RESET}"
  echo -e "${BOLD_YELLOW}4) Skip${RESET}"

  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1)
      echo -e "${BOLD_YELLOW}Installing VS Code...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y code-oss
      echo -e "${BOLD_GREEN}VS Code Installed Successfully!${RESET}"
      break
      ;;
    2)
      echo -e "${BOLD_YELLOW}Installing Geany...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y geany
      echo -e "${BOLD_GREEN}Geany Installed Successfully!${RESET}"
      break
      ;;
    3)
      echo -e "${BOLD_YELLOW}Installing VS Code and Geany (both)${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y code-oss
      pkg install -y geany
      echo -e "${BOLD_GREEN}VS Code and Geany Installed Successfully!${RESET}"
      break
      ;;
    4)
      echo -e "${BOLD_YELLOW}Skipping Installation${RESET}"
      break
      ;;
    *)
      echo -e "${BOLD_RED}Invalid option. Please try again.${RESET}"
      ;;
  esac
done
echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2
clear

echo -e "${BOLD_YELLOW}Installing XFCE4 and Some Goodies...\nWill take a while${RESET}"
pkg install -y xfce4
pkg install -y xfce4-goodies
pkg install -y xfce4-whiskermenu-plugin
pkg install -y xfce4-battery-plugin
pkg install -y xfce4-taskmanager
pkg install -y fastfetch
pkg install -y xfce4-screenshooter
pkg install -y mousepad
pkg install -y cava
echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2
clear

echo -e "${BOLD_YELLOW}Setting Up Directories & Configurations...\nWill be done within 5 minutes${RESET}"
cd ~
mkdir -p Dirs-TCM
cd ~/Dirs-TCM
wget -O Setup.tar.gz https://github.com/Prime-TITAN-CameraMan/Termux-Stuffs/raw/refs/heads/main/Configurations/Termux-XFCE4-config.tar.gz
tar -xvzf Setup.tar.gz
rsync -avh ~/Dirs-TCM/Configuration/ ~/
cd ~
rm -rf /data/data/com.termux/files/home/Dirs-TCM

mkdir -p "$HOME/bin"
cd ~/bin
wget -O apphwa https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Stuffs/refs/heads/main/bin/apphwa
wget -O cowsay https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Stuffs/refs/heads/main/bin/cowsay
wget -O native_cleaner https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Stuffs/refs/heads/main/bin/native_cleaner
wget -O proot_program https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Stuffs/refs/heads/main/bin/proot_program
wget -O startgui_env https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Stuffs/refs/heads/main/bin/startgui_env
wget -O termux-fastest-repo https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Stuffs/refs/heads/main/bin/termux-fastest-repo
wget -O termux-xfce4 https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Stuffs/refs/heads/main/bin/termux-xfce4
wget -O desktop-help https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Stuffs/refs/heads/main/bin/desktop-help

chmod +x apphwa
chmod +x cowsay
chmod +x native_cleaner
chmod +x proot_program
chmod +x startgui_env
chmod +x termux-fastest-repo
chmod +x termux-xfce4
chmod +x desktop-help
cd ~
echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2
clear

echo -e "${BOLD_YELLOW}Installing Debian PRoot Distribution...\nUsually takes few moments, 40MB file${RESET}"
proot-distro install debian
echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2 
clear

echo -e "${BOLD_YELLOW}Setting up Debian...\nCan take a while if the server is slow${RESET}"
proot-distro login debian --shared-tmp -- /bin/bash << 'EOF'
apt update 
apt upgrade -y
apt install -y sudo
apt install -y nano
apt install -y dbus-x11
apt install -y adduser
apt install -y pulseaudio
mkdir ~/bin
EOF
echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2 
clear

echo -e "${BOLD_YELLOW}Installing Communication Apps...\nUsually takes a while, depends on speed${RESET}"

while true; do
  echo -e "${BOLD_CYAN}Select Your App:${RESET}"
  echo -e "${BOLD_YELLOW}1) Discord (Vencord)${RESET}"
  echo -e "${BOLD_YELLOW}2) Telegram${RESET}"
  echo -e "${BOLD_YELLOW}3) Discord & Telegram (both)${RESET}"
  echo -e "${BOLD_YELLOW}4) Skip${RESET}"

  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1)
      echo -e "${BOLD_YELLOW}Installing Discord...${RESET}"
proot-distro login debian --shared-tmp -- /bin/bash << 'EOF'
apt update
apt install -y wget
wget -O vesktop_1.6.1_arm64.deb https://github.com/Vencord/Vesktop/releases/download/v1.6.1/vesktop_1.6.1_arm64.deb
apt install -y ./vesktop_1.6.1_arm64.deb
apt --fix-broken install -y
rm -rf vesktop_1.6.1_arm64.deb
EOF
      echo -e "${BOLD_GREEN}Discord Installed Successfully!${RESET}"
      break
      ;;
    2)
      echo -e "${BOLD_YELLOW}Installing Telegram...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y telegram-desktop
      echo -e "${BOLD_GREEN}Telegram Installed Successfully!${RESET}"
      break
      ;;
    3)
      echo -e "${BOLD_YELLOW}Installing Discord and Telegram (both)${RESET}"
proot-distro login debian --shared-tmp -- /bin/bash << 'EOF'
apt update
apt install -y wget
       
wget -O vesktop_1.5.4_arm64.deb https://github.com/Vencord/Vesktop/releases/download/v1.5.4/vesktop_1.5.4_arm64.deb
apt install -y ./vesktop_1.5.4_arm64.deb
apt --fix-broken install -y
EOF
       
       pkg update > /dev/null 2>&1
       pkg install -y telegram-desktop 
      echo -e "${BOLD_GREEN}Discord and Telegram Installed Successfully!${RESET}"
      break
      ;;
    4)
      echo -e "${BOLD_YELLOW}Skipping Installation${RESET}"
      break
      ;;
    *)
      echo -e "${BOLD_RED}Invalid option. Please try again.${RESET}"
      ;;
  esac
done

echo -e "${BOLD_GREEN}Done Succesfully...${RESET}"
sleep 2
clear

echo -e "${BOLD_CYAN}Want to pay respect to the TCM?${RESET}"
while true; do
  echo -e "${BOLD_CYAN}Run \"F\" to pay respect TCM:${RESET}"

  read -p "Type and run \"F\": " choice

  case "$choice" in
    F)
      echo "Thanks"
      sleep 2
      termux-open https://discord.gg/F2V27TC2wt
      break
      ;;
    *)
      break
      ;;
      
  esac
done

rm -rf /data/data/com.termux/files/home/termux-desktop-installation.sh

echo -e "${BOLD_CYAN}Congratulations, it's done. Now kill & restart your Termux${RESET}"

echo -e "${BOLD_CYAN}Run \"desktop-help\" to know all of the necessary commands to operate the desktop${RESET}"
