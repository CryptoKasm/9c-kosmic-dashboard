#!/bin/bash

# Elevate privilages if not root
function checkRoot() { 
    if [ "$EUID" -ne 0 ]; then
        sudo echo -ne "\r"
    fi
}

# Pull ALL source
function gitPull() {
    git pull
    git submodule update --init --recursive
    sudo apt update
}

##Set permissions for this project
function fixPermissions() {
    # Set directory permissions
    sudo find . -type d -exec chmod 755 {} \;

    # Set file permissions
    sudo find . -type f -exec chmod 644 {} \;

    # Set scripts as executable
    sudo find . -name "*.sh" -exec chmod +x {} \;
}

##############################################
# CUSTOM DEPENDENCY CODE GOES HERE
##############################################

# Install Curl 
function installCurl() {
    if ! [ -x "$(command -v curl)" ]; then
        sudo apt install curl -y

        if ! [ -x "$(command -v curl)" ]; then 
            echo "ERROR: CURL" 
        fi
    fi
}

# Install Node packages
function setupProject() {
    if ! [ -x "$(command -v npm)" ]; then
        npm install
    fi
}

# Install Node Version Manager
function installNVM() {
    HOME="$(getent passwd $USER | awk -F ':' '{print $6}')"
    
    if [ ! -d "$HOME/.nvm" ]; then
        curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
        
        source ~/.nvm

        if ! [ -f "$HOME/.nvm" ]; then 
            echo "ERROR: Node Version Manager" 
        fi
    fi
}

# Install Node
function installNode() {
    if ! [ -x "$(command -v vue)" ]; then
        source ~/.nvm/nvm.sh
        # Node Version
        vNode="v12.21.0"
        
        nvm install $vNode
        nvm use $vNode 
    fi
}

# Install Vue Cli
function installVuecli() {
    if ! [ -x "$(command -v vue)" ]; then
        npm install -g @vue/cli
        if ! [ -x "$(command -v vue)" ]; then 
            echo "ERROR: Vue CLI" 
        fi
    fi
}

# Install all custom dependencies
function installCustomDependencies() {
    installCurl
    installNVM
    installNode
    installVuecli
}

##############################################
# DONT EDIT AFTER HERE
##############################################
function mainSetup() {
    checkRoot
    gitPull
    fixPermissions
    installCustomDependencies
    setupProject
}
##############################################
case "$1" in
    --check-dependencies)
        buildDockerfile
        exit 0
        ;;
    *) 
        mainSetup
        exit 0
    ;;
esac