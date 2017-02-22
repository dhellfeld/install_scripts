#!/bin/bash

echo "Installing Anaconda (Python 2.7)..."

# Download the Anaconda 2 install script to home directory
wget https://repo.continuum.io/archive/Anaconda2-4.3.0-MacOSX-x86_64.sh -O $HOME/Anaconda2.sh

# Execute the script in batch mode, install in home directory
bash $HOME/Anaconda2.sh -b -p $HOME/Anaconda

# Remove install script
rm $HOME/Anaconda2.sh