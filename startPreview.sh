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
#############################
function mainBuild() {
    buildDist
    startPreview
}
#############################
mainBuild
