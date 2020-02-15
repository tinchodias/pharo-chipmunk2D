# pharo-chipmunk2D
Bindings from Pharo to Chipmunk2D library via uFFI




## Install

## Build C library

The objective of this step is to have the library in a directory named Chipmunk2D in the image directory.

First, download and unzip https://github.com/slembcke/Chipmunk2D/archive/Chipmunk-7.0.3.zip in a directory named Chipmunk2D. Alternatively, you can git clone with:
```
git clone git@github.com:slembcke/Chipmunk2D.git --tag Chipmunk-7.0.3
```

Second, cd to the library root directory and execute in command-line:
```
cmake -DCMAKE_C_FLAGS='-DCHIPMUNK_FFI -DCMAKE_BUILD_TYPE=Debug' .
make
```

Should show something like:
```
[ 34%] Linking C static library libchipmunk.a
[ 34%] Built target chipmunk_static
...
[ 69%] Linking C shared library libchipmunk.dylib
[ 69%] Built target chipmunk
...
[100%] Linking C executable chipmunk_demos
[100%] Built target chipmunk_demos
```

You can dig more on http://chipmunk-physics.net/release/ChipmunkLatest-Docs/ in the case something failed.

### Lib demos
You can try demos with:
```
./demo/chipmunk_demos
```
(Press keys A to Z to select demos)
