#!/bin/bash

# Command line tools
tools=(
    cmake
    curl
    git
    wget
    emacs
    sqlite
)

echo "Installing command line tools..."
brew install ${tools[@]}
