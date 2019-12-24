#!/bin/bash

# Which git user's repo
export gituser="dhellfeld"                            # ["dhellfeld" or "zoglauer"]

# Build options
export RELEASE="dev"                                  # [rel or dev]
export PATCH="yes"                                    # [yes or no]
export CLEANUP="yes"                                  # [yes or no]
export MAXTHREADS="4"                                 # [1,2,3,...]
export GEANT_PATH=~/GEANT4.10.2.p1/geant4-install/    # [/path/to/ or ""]
export ROOT_PATH=~/ROOT_v6.08.04/root-install/        # [/path/to/ or ""]
export MEGdir=$PWD/MEGAlib                            # Path to install directory

echo "Cloning into repo..."
git clone https://github.com/$gituser/megalib $MEGdir
cd $MEGdir

echo "Running the setup script..."
./setup.sh --release=$RELEASE --root=$ROOT_PATH --geant=$GEANT_PATH --maxthreads=$MAXTHREADS --patch=$PATCH --cleanup=$CLEANUP


echo "Done!"

# Print bashrc advice to screen (user can decide to use or not...)
echo "\nAdd the following to your .bashrc or .bash_profile:\n"
echo "#--------------------------------"
echo "#  MEGAlib\n"
echo ". $MEGdir/bin/source-megalib.sh"
echo "# --------------------------------\n"