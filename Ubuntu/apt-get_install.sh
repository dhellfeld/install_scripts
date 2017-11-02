#!/bin/bash

repos=(
    ppa:webupd8team/atom
    ppa:webupd8team/sublime-text-2
)

packages=(
  openssh-server
  dconf-tools
  emacs
  chromium-browser
  git
  atom
  sublime-text
  libx11-dev
  libxpm-dev
  libxmu-dev
  libxft-dev
  libxext-dev
  binutils
  xauth
  xorg
  openbox
  libgl1-mesa-dev
  mesa-common-dev
  libxi-dev
  libglu1-mesa-dev
  cmake
  dpkg-dev
  g++
  gcc
)

sudo apt-get update
for repo in "${repos[@]}"
do
    sudo add-apt-repository -y $repo
done

sudo apt-get update
sudo apt-get install -y ${packages[@]}
