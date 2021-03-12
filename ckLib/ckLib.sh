#!/bin/bash
source ./VERSION

Debug=0

#+---------------------------------------------+#
# CryptoKasm Bash Library                     |#
#+---------------------------------------------+#
# Color Styles
Yellow="\e[33m"
Cyan="\e[36m"
Magenta="\e[35m"
Green="\e[92m"
Red="\e[31m"
RS="\e[0m"
RSL="\e[1A\e["
RSL2="\e[2A\e["
RSL3="\e[3A\e["
sB="\e[1m"

#+-------------------------
# Color Scheme
P=$sB$Yellow
S=$sB$Cyan
T=$sB$Magenta
C=$sB$Green
F=$sB$Red

#+-------------------------
# Spinner
function _spinner() {
    # $1 start/stop
    #
    # on start: $2 display message
    # on stop : $2 process exit status
    #           $3 spinner function pid (supplied from stop_spinner)

    local on_success="DONE"
    local on_fail="FAIL"

    case $1 in
        start)
            # calculate the column where spinner and status msg will be displayed
            let column=$(tput cols)-${#2}-60
            # display message and position the cursor in $column column
            #echo -ne $P"|$T --$1    "$RS
            echo -ne $P"|$T --${2}    "$RS
            printf "%${column}s"

            # start spinner
            i=1
            sp='\|/-'
            delay=${SPINNER_DELAY:-0.15}

            while :
            do
                printf "$P\b${sp:i++%${#sp}:1}"
                sleep $delay
            done
            ;;
        stop)
            if [[ -z ${3} ]]; then
                echo "spinner is not running.."
                exit 1
            fi

            kill $3 > /dev/null 2>&1

            # inform the user uppon success or failure
            echo -en $P"\b["$RS
            if [[ $2 -eq 0 ]]; then
                echo -en $C"${on_success}"$RS
            else
                echo -en $F"${on_fail}"$RS
            fi
            echo -e $P"]"$RS
            ;;
        *)
            echo "invalid argument, try {start/stop}"
            exit 1
            ;;
    esac
}

function startSpinner {
    # $1 : msg to display
    _spinner "start" "${1}" &
    # set global spinner pid
    _sp_pid=$!
    disown
}

function stopSpinner {
    sleep 0.5
    # $1 : command exit status
    _spinner "stop" $1 $_sp_pid
    unset _sp_pid
}

#+-------------------------
# Console Text Styles
function sIntro() {
    echo -e $P"+-----------------------------------------------------------------------------+"
    echo -e $P"|$S _________                        __          ____  __.                       "
    echo -e $P"|$S \_   ___ \_______ ___.__._______/  |_  ____ |    |/ _|____    ______ _____   "
    echo -e $P"|$S /    \  \/\_  __ <   |  |\____ \   __\/  _ \|      < \__  \  /  ___//     \  "
    echo -e $P"|$S \     \____|  | \/\___  ||  |_> >  | (  <_> )    |  \ / __ \_\___ \|  Y Y  \ "
    echo -e $P"|$S  \______  /|__|   / ____||   __/|__|  \____/|____|__ (____  /____  >__|_|  / "
    echo -e $P"|$S         \/        \/     |__|                       \/    \/     \/      \/  "
    echo -e $P"+-----------------------------------------------------------------------------+"
    echo -e $P"|$S Project: $REPO   $P|$S Version: $VERSION   $P|$S Platform: $(cPlatform)"
    echo -e $P"+-----------------------------------------------------------------------------+"$RS
}
function sTitle() {
    echo -e $P">$S $1"$RS
}
function sEntry() {
    echo -e $P"|$T --$1    "$RS
}
function sSpacer() {
    echo -e $P"|"$RS
}
function sL() {
    echo -e $P"+-----------------------------------------+"$RS
}
function sLL() {
    echo -e $P"+-----------------------------------------------------------------------------+"$RS
}
#sExample () {}
#sErorr() {}

function sAction() {
    echo -e $P"|$sB   $1"$RS
}
function sMenuEntry() {
    echo -e $P"|$T $1"$RS
}

#+---------------------------------------------+#
# Functions                                    
#+---------------------------------------------+#
# Check if debugging is enabled
function debug() {
    if [ "$Debug" == 1 ]; then 
        echo "$1"
    else
        return
    fi
}

# Throw error code and exit script
function errCode()
{
  echo -e $F">ERROR: $1"$RS 1>&2
  exit 1
}

# Pull new source code from github
function checkGit() {
    git pull
    git submodule update --init --recursive
}

# Elevate privilages if not root
function cRoot() { 
    debug "Check: ROOT"
    if [ "$EUID" -ne 0 ]; then
        sudo echo -ne "\r"
    fi
    debug "Check: ROOT > $EUID"
}

# Check the host platform
function cPlatform() {
    debug "Check: Platform"
    if grep -q icrosoft /proc/version; then
        PLATFORM="WSL"
    else
        PLATFORM="NATIVE"
    fi
    debug "Check: Platform > $PLATFORM"
    echo $PLATFORM
}

# Check if SECRET exist and load if found
function cSECRET() {
    if [ -f "SECRET" ]; then
        source ./SECRET
    else
        errCode "SECRET NOT FOUND!"
    fi
}

# Check if PARAMS exist and load if found
function cPARAMS() {
    if [ -f "PARAMS" ]; then
        source ./PARAMS
    else
        errCode "PARAMS NOT FOUND!"
    fi
}

# Set permissions for this project
function cPermissions() {
    # Set directory permissions
    sudo find . -type d -exec chmod 755 {} \;

    # Set file permissions
    sudo find . -type f -exec chmod 644 {} \;

    # Set scripts as executable
    sudo find . -name "*.sh" -exec chmod +x {} \;
}

#+---------------------------------------------+#
# Commonly Used Programs                                  
#+---------------------------------------------+#
# Install: Docker
installDocker() {
    if ! [ -x "$(command -v docker)" ]; then
        if [ $(cPlatform) = "NATIVE" ]; then
            # Removing leftovers if Docker is not found
            {
            sudo apt remove --yes docker docker-engine docker.io containerd runc
            sudo apt update
            sudo apt --yes --no-install-recommends install apt-transport-https ca-certificates

            wget --quiet --output-document=- https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
            sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release --codename --short) stable"
            sudo apt update

            sudo apt --yes --no-install-recommends install docker-ce docker-ce-cli containerd.io
            sudo usermod --append --groups docker "$USER"
            sudo systemctl enable docker
            } &> /dev/null

            if ! [ -x "$(command -v unzip)" ]; then
                stopSpinner $? 
                errCode "Can't install 'docker'" 
            fi
        else
            stopSpinner $?
            errCode "Start Docker Desktop on Wondows"          
        fi
    fi
}

# Install: Docker-Compose
installCompose() {
    # Get: Compose Latest Version
    compose_release() {
        curl --silent "https://api.github.com/repos/docker/compose/releases/latest" |
        grep -Po '"tag_name": "\K.*?(?=")'
    }

    if ! [ -x "$(command -v docker-compose)" ]; then
        sudo curl -# -L https://github.com/docker/compose/releases/download/$(compose_release)/docker-compose-$(uname -s)-$(uname -m) \
        -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose
        
        if ! [ -x "$(command -v unzip)" ]; then
            stopSpinner $? 
            errCode "Can't install 'docker-compose'"
        fi
    fi
}

# Install: JQ
installJq() {
    if ! [ -x "$(command -v jq)" ]; then
        sudo apt install jq -y &> /dev/null

        if ! [ -x "$(command -v jq)" ]; then 
            errCode "Can't install 'jq'" 
        fi
    fi
}

###############################################
function ckMain() {
    sIntro
    sTitle "Building docker image: 9c-kosmic-node"
    startSpinner "pulling source..."
    sleep 5
    stopSpinner $?
    sTitle "Building docker image: 9c-kosmic-explorer"
 
    startSpinner "Testing: Spinner"
    sleep 5
    stopSpinner $?
}
###############################################
case "$1" in
    --installDocker)
        installDocker
        exit 0
        ;;

    --installCompose)
        installCompose
        exit 0
        ;;

    *) 
        #ckmain
        exit 0
    ;;
esac

