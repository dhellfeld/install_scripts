#/!bin/bash

# Choose version (each must be two digits!) -- eventually put this into command line argument
export MAJOR="10"
export MINOR="02"
export PATCH="01"

# Create some useful variable names
export geant="geant4.${MAJOR}.${MINOR}.p${PATCH}.tar.gz"
export g4dir="GEANT4.${MAJOR}.${MINOR}.p${PATCH}"
export g4vers="$((MAJOR+0)).$((MINOR+0)).$((PATCH+0))"

# Choose build options
export OPENGL_X11="ON"
export RAYTRACER_X11="ON"
export USE_QT="ON"
export MULTITHREADED="OFF"
export INSTALL_DATA="ON"
export USE_SYSTEM_EXPAT="OFF"
export CXXSTD="11"
export STATIC_LIBS="OFF"

echo "Downloading source..."
if [ ! -a "$geant" ]; then
    curl -O http://geant4.cern.ch/support/source/$geant
fi

echo "Organizing directories..."
if [ ! -d "$g4dir" ]; then
    mkdir $g4dir
    mkdir $g4dir/geant4-build
    mkdir $g4dir/geant4-source
    mkdir $g4dir/geant4-install
    mkdir $g4dir/geant4-data
fi

echo "Unpacking..."
tar xf $geant -C $g4dir/geant4-source --strip-components=1

echo "Moving tarball into Geant directory..."
mv $geant $g4dir  # rm $geant


echo "Moving to build directory..."
cd $g4dir/geant4-build
export install_dir=$PWD/../geant4-install
export data_dir=$PWD/../geant4-data

echo "Starting build with cmake..."
cmake -DGEANT4_USE_OPENGL_X11=$OPENGL_X11         \
      -DGEANT4_USE_RAYTRACER_X11=$RAYTRACER_X11   \
      -DGEANT4_USE_QT=$USE_QT                     \
      -DBUILD_STATIC_LIBS=$STATIC_LIBS            \
      -DGEANT4_BUILD_CXXSTD=$CXXSTD               \
      -DGEANT4_BUILD_MULTITHREADED=$MULTITHREADED \
      -DGEANT4_USE_SYSTEM_EXPAT=$USE_SYSTEM_EXPAT \
      -DGEANT4_INSTALL_DATADIR=$data_dir          \
      -DGEANT4_INSTALL_DATA=$INSTALL_DATA         \
      -DCMAKE_INSTALL_PREFIX=$install_dir         \
      ../geant4-source

echo "Starting make and make install..."
make -j4;
make install;


echo "Writing example build script..."
cd ../
cat <<EOT>> sim_compile_script.sh
echo "Building..."
cmake -DGeant4_DIR=~/$g4dir/geant4-install/lib/Geant4-$g4vers/ .

echo "Make..."
make -j4

echo "Done!"
EOT


echo "Done!"


## Some additional geant4 build options that can be used
# -DCMAKE_C_COMPILER=/path/to/compiler
# -DCMAKE_PREFIX_PATH=/Applications/Qt/5.3
# -DQT_QMAKE_EXECUTABLE=/Applications/Qt/5.3/clang_64/bin
# for qt, put the qmake exe in $PATH


