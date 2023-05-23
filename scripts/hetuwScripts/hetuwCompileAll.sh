#!/bin/sh

if [ ! -e bin ]
then
	mkdir bin
fi

if [ -e linux ]
then
	echo "compiling for linux..."
	cd linux
	./runToBuild 1 || { echo "Error while compiling linux"; exit 1; }
	cp OneLifeApp ../bin/OneLifeApp_H_linux
	cd ..
fi

if [ -e windows ]
then
	echo "compiling for windows..."
	cd windows
	./runToBuild 5 || { echo "Error while compiling windows"; exit 1; }
	echo "Test"
	pwd
	ls -lah
	echo "..... OneLife/gameSource"
	ls -lah OneLife/gameSource
	cp -v OneLife/gameSource/OneLife.exe ../bin/OneLifeApp_H_windows.exe
	cd ..
fi

