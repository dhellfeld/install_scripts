# Where is geant4
export g4dir="~/GEANT4.10.2.p01"

if [ -d "$g4dir" ]; then

    # Brew dependencies
	brew install xerces-c
	brew install boost
	brew install boost-python

	# Soft link libboost_python27 to libboost_python
	ln -s /usr/local/libboost_python27.dylib /usr/local/libboost_python.dylib
	ln -s /usr/local/libboost_python27.a /usr/local/libboost_python.a

	# Go into Geant4 directory
	cd $g4dir/geant4-source/environments/g4py/

	# Build
	mkdir build
	cd build
	cmake ../

	# Make
	make
	make install
	
else
	echo "Cannot find Geant4 directory: $g4dir"
fi



