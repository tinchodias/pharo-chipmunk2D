#!/bin/bash
set -xe

COMMIT_HASH=d0239ef4599b3688a5a336373f7d0a68426414ba

rm -rf build
mkdir build
cd build

wget https://github.com/slembcke/Chipmunk2D/archive/$COMMIT_HASH.zip
unzip $COMMIT_HASH.zip 
cd Chipmunk2D-$COMMIT_HASH/

cmake cmake -DBUILD_DEMOS=OFF .
make

cd ../../
THE_LIBS=build/Chipmunk2D-$COMMIT_HASH/src/libchipmunk.so*
mv $THE_LIBS .
rm -rf build

echo $(pwd)
ls -la