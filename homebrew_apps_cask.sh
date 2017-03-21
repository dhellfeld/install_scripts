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
    geektool
    google-drive
    insomniax
    nvalt
    textwrangler
    microsoft-office-2011
    microsoft-office
    doxygen
    ubersicht
    spectacle
    bettertouchtool
    github-desktop
    virtualbox
)

echo "Installing applications..."
brew cask install --appdir="/Applications" ${applications[@]}


# --
# Still deciding whether I want to use 2011 and 2016 office, install both for now

# Reorganize Microsoft 2016 install. Delete Outlook and OneNote
cd /Applications
mkdir Microsoft\ Office\ 2016
mv Microsoft\ Word.app Microsoft\ PowerPoint.app Microsoft\ Excel.app Microsoft\ Office\ 2016
rm -r Microsoft\ Outlook.app Microsoft\ OneNote.app
cd ~/

# Delete Microsoft Office 2011 Outlook
rm -rf /Applications/Microsoft\ Office\ 2011/Microsoft\ Outlook.app


# --
# List of applications that must be installed by hand
# Mathemtica
# Matlab
# DivX player
# Cisco Anyconnect
# Symantec Endpoint Protection
