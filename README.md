# Pharo Chipmunk2D bindings

Pharo uFFI bindings to use [Chipmunk2D library](http://chipmunk-physics.net/).


## Install

There are two steps that may be done in parallel. One if building the C library, and second, get Pharo 8 and load the bindings.

### Build C library

The objective of this step is to have the library in a directory named Chipmunk2D in the image directory.

First, download and unzip [this file](https://github.com/slembcke/Chipmunk2D/archive/Chipmunk-7.0.3.zip) in a directory named Chipmunk2D. Alternatively, you can git clone with:
```
git clone git@github.com:slembcke/Chipmunk2D.git -b Chipmunk-7.0.3 --depth 1
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

You can dig more [docs](http://chipmunk-physics.net/release/ChipmunkLatest-Docs/) in the case something failed.

**Try original demos:**
Run library demos with `./demo/chipmunk_demos`. Press keys A to Z to select between demos.


### Build Pharo bindings

Evaluate in Pharo 8:

~~~Smalltalk
Metacello new 
  baseline: 'Chipmunk2D'; 
  repository: 'github://tinchodias/pharo-chipmunk2D/';
  load.
~~~

Ensure in `CpLibrary` class that whether `macModuleName` or `unixModuleName` point to the right file.
