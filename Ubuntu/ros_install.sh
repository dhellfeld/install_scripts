#!/bin/bash

# User defined build/install variables
VERSION="kinetic"

# Accept software from ros.org
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Update everything
sudo apt-get update

# Full install
sudo apt-get install -y ros-$VERSION-desktop-full

# Initialize rosdep
sudo rosdep init
rosdep update

# Install more ROS tools
sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

# Add symbolic link to home directory pointing to ROS install
ln -s /opt/ros/$VERSION ~/ROS_$VERSION

echo "Done!"

# Reccomend add to bashrc
echo "\nAdd this line to your bashrc to source ROS:"
echo "# Source ROS"
echo "source /opt/ros/$VERSION/setup.bash"
