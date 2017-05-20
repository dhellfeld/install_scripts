#!/bin/bash

# Applications
applications=(
    atom
    filezilla
    flux
    google-chrome
    google-chrome-canary
    iterm2
    spotify
    sublime-text2
    vlc
    xquartz
    mactex
    firefox
    dropbox
    adobe-reader
    google-drive
    insomniax
    nvalt
    textwrangler
    microsoft-office
    doxygen
    ubersicht
    spectacle
    bettertouchtool
    github-desktop
    virtualbox
    slack
    box-sync
    sketchup
    skype
)

echo "Installing applications..."
brew cask install --appdir="/Applications" ${applications[@]}


# Reorganize Microsoft 2016 install. Delete Outlook and OneNote
cd /Applications
mkdir Microsoft\ Office\ 2016
mv Microsoft\ Word.app Microsoft\ PowerPoint.app Microsoft\ Excel.app Microsoft\ Office\ 2016
rm -r Microsoft\ Outlook.app Microsoft\ OneNote.app
cd ~/


# --
# List of applications that must be installed by hand
# Mathemtica, Matlab, DivX player, Cisco Anyconnect, Symantec Endpoint Protection
