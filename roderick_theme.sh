#!/bin/bash
# Filename: roderick_theme.sh
# Objective: Mag-install ng tools at mag-setup ng custom "Hacker-Style" Banner sa Termux.

# --------------------------
# 1. Configuration
# --------------------------

# Ang pangalan ng file kung saan ise-save ang banner command (Para sa permanenteng display)
CONFIG_FILE="$HOME/.bashrc"
SCRIPT_NAME="roderick_theme.sh"

# --------------------------
# 2. Function: Check Prerequisites & Install Tools
# --------------------------
check_prereqs() {
    clear
    echo -e "\033[1;33m>>> 1/3: Checking/Installing Required Tools (figlet, toilet, lolcat)... \033[0m"
    # I-install ang figlet, toilet, at lolcat nang tahimik
    pkg install figlet toilet lolcat -y &> /dev/null
    
    # I-display ang welcome banner para sa installation
    echo -e "\n\033[1;32m"
    figlet -f standard "SETUP START" | lolcat -f
    echo -e "\033[0m"
}

# --------------------------
# 3. Function: Create and Install Banner
# --------------------------
create_and_install_banner() {
    clear
    echo -e "\n\033[1;33m>>> 2/3: Customizing Banner...\033[0m"
    
    # Kumuha ng input mula sa user (Ang Name/Handle mo)
    read -p "I-type ang iyong HACKER/DISPLAY NAME: " USER_HANDLE
    
    # I-define ang BANNER COMMAND (HACKER DESIGN)
    # Gumagamit ng "termux" font (parang Matrix)
    BANNER_COMMAND="toilet -f termux -F metal \"$USER_HANDLE\""
    
    # I-clear ang .bashrc at ilagay ang bagong banner
    echo -e "\n\033[1;33m>>> Updating Termux Shell Configuration... (clearing old .bashrc)\033[0m"
    
    # 1. I-clear ang screen at i-display ang Banner
    echo "clear" > "$CONFIG_FILE"
    echo "echo -e \"\n\033[1;32m\"" >> "$CONFIG_FILE"
    echo "$BANNER_COMMAND | lolcat -f" >> "$CONFIG_FILE"
    echo "echo -e \"\033[0m\"" >> "$CONFIG_FILE"
    
    # 2. I-display ang Tagline/Welcome Message
    echo "echo -e \"\033[1;31m--------------------------------------------------\033[0m\"" >> "$CONFIG_FILE"
    echo "echo -e \"\033[1;37m>> TOP HACKER IMAGE MODE ACTIVATED <<\033[0m\"" >> "$CONFIG_FILE"
    echo "echo -e \"\033[1;37m>> Type 'help' to start the system. <<\033[0m\"" >> "$CONFIG_FILE"
    echo "echo -e \"\033[1;31m--------------------------------------------------\033[0m\"" >> "$CONFIG_FILE"
    echo "echo -e \"\n\"" >> "$CONFIG_FILE"
}

# --------------------------
# 4. Main Execution
# --------------------------

check_prereqs
create_and_install_banner

echo -e "\033[1;33m>>> 3/3: Installation Complete!\033[0m"
echo -e "\033[1;32mSUCCESS: Ang iyong custom theme ay na-save sa $CONFIG_FILE.\033[0m"
echo -e "\n\033[1;37mFINAL STEP:\033[0m"
echo -e "Paki-\033[1;36mCLOSE at OPEN ULIT\033[0m ang Termux app para makita ang bagong theme!"
echo "--------------------------------------------------"