#!/bin/bash

# Applications
applications=(
    atom
    filezilla
    flux
    google-chrome
    iterm2
    spotify
    sublime-text2
    vlc
    xquartz
    mactex
    firefox
    dropbox
    adobe-reader
    geektool
    google-drive
    insomniax
    nvalt
    textwrangler
    microsoft-office-2011
    doxygen
    ubersicht
)

echo "Installing applications..."
brew cask install --appdir="/Applications" ${applications[@]}


## List of applications that must be installed by hand
# Mathemtica
# Matlab
# DivX player
# Cisco Anyconnect
# Symantec Endpoint Protection
