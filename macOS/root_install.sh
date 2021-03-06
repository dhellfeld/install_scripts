#!/bin/bash

# Choose version (each must be two digits!) -- eventually put this into command line argument
export MAJOR="06"
export MINOR="08"
export PATCH="04"

# Create some useful variable names
export cernroot="root_v$((MAJOR+0)).$MINOR.$PATCH.source.tar.gz"
export cernrootdir="ROOT_v$((MAJOR+0)).$MINOR.$PATCH"
export topdir=$PWD

echo "Downloading source..."
if [ ! -a "$cernroot" ]; then
    wget https://root.cern.ch/download/$cernroot
fi

echo "Organizing directories..."
if [ ! -d "$cernrootdir" ]; then
    mkdir $cernrootdir
    mkdir $cernrootdir/root-build
    mkdir $cernrootdir/root-source
    mkdir $cernrootdir/root-install
fi

echo "Unpacking..."
tar xf $cernroot -C $cernrootdir/root-source --strip-components=1

echo "Moving tarball into ROOT directory..."
mv $cernroot $cernrootdir


echo "Moving to build directory..."
cd $cernrootdir/root-build
export install_dir=$topdir/$cernrootdir/root-install

## Old way with configure
#echo "Configuring ROOT..."
#./configure --all 
#./configure --prefix=$install_dir --etcdir=$install_dir/etc --enable-qt --enable-cxx11 --enable-minuit2 --enable-python --disable-bonjour --disable-castor

# New way with cmake
# Doesn't seem to like it when I specify certain variables like -D minuit2=ON, just use --all for now)
echo "Building ROOT..."
cmake --all                                       \
      -DCMAKE_INSTALL_PREFIX:PATH=$install_dir    \
      ../root-source

# Additional build option available at:
# https://root.cern.ch/building-root#options

echo "Starting make and make install..."
make -j4;
sudo make install;

echo "Done!"

# Print bashrc advice to screen (user can decide to use or not...)
echo "\nAdd the following to your .bashrc or .bash_profile:\n"
echo "#--------------------------------"
echo "#  ROOT\n"
echo ". $topdir/$cernrootdir/root-install/bin/thisroot.sh"
echo "export PYTHONPATH=/path/to/Anaconda/"
echo "alias root='root -l'\n"
echo "# --------------------------------\n"
