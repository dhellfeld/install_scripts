#!/bin/sh

# Update
echo "Updating gem..."
sudo gem update --system

# Install
tools=(
    pygments.rb
)

echo "Installing some tools with gem..."
sudo gem install ${tools[@]}