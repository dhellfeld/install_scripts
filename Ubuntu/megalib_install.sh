#!/bin/bash

# Which git user's repo
export gituser="zoglauer"                            # ["dhellfeld" or "zoglauer" or whatever username...]

# Build options
export RELEASE="dev"                                  # [rel or dev]
export PATCH="yes"                                    # [yes or no]
export CLEANUP="yes"                                  # [yes or no]
export MAXTHREADS="4"                                 # [1,2,3,...]
export GEANT_PATH=~/GEANT4.10.2.p1/geant4-install/    # [/path/to/ or ""]
export ROOT_PATH=~/ROOT_v6.08.04/root-install/        # [/path/to/ or ""]
export MEGdir=~/MEGAlib                               # Path to install directory

echo "Cloning into repo..."
git clone https://github.com/$gituser/megalib $MEGdir
cd $MEGdir

echo "Running the setup script..."
./setup.sh --release=$RELEASE --root=$ROOT_PATH --geant=$GEANT_PATH --maxthreads=$MAXTHREADS --patch=$PATCH --cleanup=$CLEANUP

echo "Done!"

# Print bashrc advice to screen
echo "Add the following to your bashrc:"
echo "# Source MEGAlib"
echo "source $MEGdir/bin/source-megalib.sh"
