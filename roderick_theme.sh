#!/bin/bash
# Filename: roderick_theme.sh
# Objective: Mag-install ng tools at mag-setup ng custom "Hacker-Style" Banner sa Termux.

# --------------------------
# 1. Configuration
# --------------------------

CONFIG_FILE="$HOME/.bashrc"
LOGO_FILE="roderick_logo.txt"

# --------------------------
# 2. Function: Check Prerequisites & Install Tools
# --------------------------
check_prereqs() {
    clear
    echo -e "\033[1;33m>>> 1/3: Checking/Installing Required Tools (figlet, toilet, curl)... \033[0m"
    pkg install figlet toilet curl -y &> /dev/null
    
    # I-display ang welcome banner para sa installation
    echo -e "\n\033[1;32m"
    figlet -f standard "SETUP START" | toilet -f termux -F metal
    echo -e "\033[0m"
}

# --------------------------
# 3. Function: Create and Install Banner
# --------------------------
create_and_install_banner() {
    clear
    echo -e "\n\033[1;33m>>> 2/3: Customizing Banner...\033[0m"
    
    # Kumuha ng input mula sa user (Ang Name/Handle mo)
    read -p "I-type ang iyong YOUR/DISPLAY NAME: " USER_HANDLE
    
    # I-define ang BANNER COMMAND (Naka-fixed na ang mono12 font at Fmetal filter)
    # Gagamit ng -F metal filter at mono12 font
    BANNER_COMMAND="toilet -f mono12 -Fmetal \"$USER_HANDLE\""
    
    echo -e "\n\033[1;33m>>> Updating Termux Shell Configuration... (clearing old .bashrc)\033[0m"
    
    # 1. I-clear ang screen
    echo "clear" > "$CONFIG_FILE"
    
    # 2. I-display ang Malaking Logo (Gagamit ng lolcat at cat para sa file)
    echo "echo -e \"\n\033[1;36m\"" >> "$CONFIG_FILE" # Cyan color for logo
    echo "cat $LOGO_FILE | lolcat -f" >> "$CONFIG_FILE" # Pipe ang logo file sa lolcat
    echo "echo -e \"\033[0m\"" >> "$CONFIG_FILE" # Reset color
    
    # 3. I-display ang Malaking Text Banner
    echo "echo -e \"\033[1;33m\"" >> "$CONFIG_FILE" # Yellow color for text
    echo "$BANNER_COMMAND" >> "$CONFIG_FILE"
    
    # 4. I-display ang Tagline/Welcome Message
    echo "echo -e \"\033[0m\"" >> "$CONFIG_FILE" # Reset color
    echo "echo -e \"\033[1;31m--------------------------------------------------\033[0m\"" >> "$CONFIG_FILE"
    echo "echo -e \"\033[1;37m>> DOWNLOAD STREAMIX PH APP TO WATCH MOVIE <<\033[0m\"" >> "$CONFIG_FILE"
    echo "echo -e \"\033[1;37m>> Type 'help' to start the system. <<\033[0m\"" >> "$CONFIG_FILE"
    echo "echo -e \"\033[1;31m--------------------------------------------------\033[0m\"" >> "$CONFIG_FILE"
    echo "echo -e \"\n\"" >> "$CONFIG_FILE"
}

# --------------------------
# 4. Main Execution
# --------------------------

check_prereqs
# FORCE DOS2UNIX to avoid the ^M error
if command -v dos2unix &> /dev/null; then
    dos2unix "$LOGO_FILE"
fi
create_and_install_banner

echo -e "\033[1;33m>>> 3/3: Installation Complete!\033[0m"
echo -e "\033[1;32mSUCCESS: Ang iyong custom theme ay na-save sa $CONFIG_FILE.\033[0m"
echo -e "\n\033[1;37mFINAL STEP:\033[0m"
echo -e "Paki-\033[1;36mCLOSE at OPEN ULIT\033[0m ang Termux app para makita ang bagong theme!"
echo "--------------------------------------------------"