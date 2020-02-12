#/!bin/bash

### TO RUN
# $ sh install_geant4.sh <path/to/install_directory>

# Choose version (each must be two digits!) -- eventually put this into command line argument
export MAJOR="10"
export MINOR="06"
export PATCH="00"

# Create some useful variable names
if [ "$PATCH" == "00" ]; then
   export geant="geant4.${MAJOR}.${MINOR}.tar.gz"
else
   export geant="geant4.${MAJOR}.${MINOR}.p${PATCH}.tar.gz"
fi
export g4dir="GEANT4.$((MAJOR+0)).$((MINOR+0)).p$((PATCH+0))"
export g4vers="$((MAJOR+0)).$((MINOR+0)).$((PATCH+0))"

# Move to home directory and creat geant4 dir
top_dir=$1
mkdir -p $top_dir
cd $top_dir

# Choose build options
export OPENGL_X11="ON"
export RAYTRACER_X11="ON"
export USE_QT="OFF"
export MULTITHREADED="OFF"
export INSTALL_DATA="ON"
export USE_SYSTEM_EXPAT="OFF"
export CXXSTD="11"
export STATIC_LIBS="OFF"

echo "Downloading source..."
if [ ! -a "$geant" ]; then
    curl -OL http://geant4.cern.ch/support/source/$geant
fi

echo "Organizing directories..."
if [ ! -d "$g4dir" ]; then
    mkdir -p $g4dir
    mkdir -p $g4dir/geant4-build
    mkdir -p $g4dir/geant4-source
    mkdir -p $g4dir/geant4-install
    mkdir -p $g4dir/geant4-data
fi

echo "Unpacking..."
tar xf $geant -C $g4dir/geant4-source --strip-components=1

echo "Delete tarball"
rm $geant

echo "Moving to build directory..."
cd $g4dir/geant4-build
export install_dir=$top_dir/$g4dir/geant4-install
export data_dir=$top_dir/$g4dir/geant4-data

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

## Some additional geant4 build options I've used before...
# -DCMAKE_C_COMPILER=/path/to/compiler
# -DCMAKE_PREFIX_PATH=/Applications/Qt/5.3
# -DQT_QMAKE_EXECUTABLE=/Applications/Qt/5.3/clang_64/bin
# for qt, put the qmake exe in $PATH
# more found here: http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/InstallationGuide/html/ch02s03.html

# Num cores
ncores=$(python -c "import multiprocessing as mp; print(mp.cpu_count())")

echo "Starting make and make install..."
make "-j${ncores}"
make install

echo "Writing selected build options to file and placing in $top_dir/$g4dir/geant4-build..."
cd $top_dir/$g4dir/geant4-build
cat <<EOT>> BUILDOPTIONS.txt
OPENGL_X11=$OPENGL_X11
RAYTRACER_X11=$RAYTRACER_X11
USE_QT=$USE_QT
MULTITHREADED=$MULTITHREADED
INSTALL_DATA=$INSTALL_DATA
USE_SYSTEM_EXPAT=$USE_SYSTEM_EXPAT
CXXSTD=$CXXSTD
STATIC_LIBS=$STATIC_LIBS
EOT

echo "Done!"

# Print bashrc advice to screen
echo "Add the following to your bashrc:"
echo "# Source Geant4"
echo "source $top_dir/$g4dir/geant4-install/share/Geant4-$g4vers/geant4make/geant4make.sh"
echo "source $top_dir/$g4dir/geant4-install/bin/geant4.sh"
echo "export G4WORKDIR=."
