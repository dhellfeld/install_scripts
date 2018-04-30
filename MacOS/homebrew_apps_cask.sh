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
    google-backup-and-sync
    insomniax
    nvalt
    textwrangler
    microsoft-office
    doxygen
    ubersicht
    spectacle
    virtualbox
    slack
    sketchup
    skype
    java
    github
    meshlab
    real-vnc
    vnc-viewer
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

# --
# List of some opps I've used in the past, but not currently
# bettertouchtool
