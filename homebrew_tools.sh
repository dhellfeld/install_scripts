#!/bin/bash

# Command line tools
tools=(
    cmake
    curl
    git
    wget
    emacs
    sqlite
    glew
    glm
    libconfig
    pandoc
)

echo "Installing command line tools..."
brew install ${tools[@]}
