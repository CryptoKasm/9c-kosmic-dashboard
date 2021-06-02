#!/bin/bash

# Build distribution | Output Directory: /dist
function buildDist() {
    yarn build
}

# Build Dockerfile | Output Directory: 
function buildDockerfile() {
    source ./VERSION
    ImageName="$REPO:$VERSION"
    echo $ImageName
    docker build -t $ImageName .
}

function startPreview() {
    docker-compose build
    docker-compose up -d
}

# function checkInstall() {
#     # Function to check if node_modules exists, if not run yarn install
# }

#############################
function mainBuild() {
    yarn install
    buildDist
    startPreview
}
#############################
mainBuild
