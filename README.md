# Pharo Chipmunk2D bindings

Pharo FFI bindings to use [Chipmunk2D](http://chipmunk-physics.net/).

Chipmunk2D is a simple, lightweight, fast and portable 2D rigid body physics library written in C. It’s licensed under the unrestrictive, OSI approved MIT license. Hundreds of shipping games have chosen Chipmunk because of the high quality, speed, and accuracy of its 2D physics simulations. 

## Install

There are two steps that may be done in parallel. One if building the C library, and second, get Pharo and load the bindings.

**Build C library**

The objective of this step is to have the library in a directory named Chipmunk2D in the image directory.

First, git clone and checkout a specific commit:
```bash
git clone git@github.com:slembcke/Chipmunk2D.git
cd Chipmunk2D
git checkout d0239ef4599b3688a5a336373f7d0a68426414ba
```
Why that commit? at the moment of writing this README, the most recent tag in the chipmunk repo is too old (7.0.3) and build fails.

Second, cd to the library root directory and execute in command-line:
```bash
cmake .
make
```

It should show something like:
```
[ 34%] Linking C static library libchipmunk.a
[ 34%] Built target chipmunk_static
...
[ 69%] Linking C shared library libchipmunk.dylb
[ 69%] Built target chipmunk
...
[100%] Linking C executable chipmunk_demos
[100%] Built target chipmunk_demos
```

You can run the original library demos with `./demo/chipmunk_demos`. Press keys A to Z to select between scenes.


**Build Pharo bindings**

Evaluate in Pharo 11:

~~~Smalltalk
Metacello new 
  baseline: 'Chipmunk2D'; 
  repository: 'github://tinchodias/pharo-chipmunk2D/';
  load.
~~~

Ensure in `CpLibrary` class that whether `macModuleName` or `unixModuleName` point to the right file.

