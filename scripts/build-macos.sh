#!/usr/bin/env bash
set -eaux

source scripts/common.sh

brew install cmake ninja pkg-config

for p in pango cairo proj netcdf
do
    brew install $p
    v=$(brew info $p | grep Cellar | awk '{print $1;}' | awk -F/ '{print $NF;}')
    echo "brew $p $v" >> versions
done

# Build eccodes

cd $TOPDIR/build-ecmwf/eccodes

$TOPDIR/src/ecbuild/bin/ecbuild \
    $TOPDIR/src/eccodes \
    -GNinja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DENABLE_PYTHON=0 \
    -DENABLE_FORTRAN=0 \
    -DENABLE_BUILD_TOOLS=0 \
    -DENABLE_MEMFS=1 \
    -DENABLE_INSTALL_ECCODES_DEFINITIONS=0 \
    -DENABLE_INSTALL_ECCODES_SAMPLES=0 \
    -DCMAKE_INSTALL_PREFIX=$TOPDIR/install \
    -DCMAKE_INSTALL_RPATH=$TOPDIR/install/lib

cd $TOPDIR
cmake --build build-ecmwf/eccodes --target install

# Build magics

cd $TOPDIR/build-ecmwf/magics
$TOPDIR/src/ecbuild/bin/ecbuild \
    $TOPDIR/src/magics \
    -GNinja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DENABLE_PYTHON=0 \
    -DENABLE_FORTRAN=0 \
    -DENABLE_BUILD_TOOLS=0 \
    -Deccodes_DIR=$TOPDIR/install/lib/cmake/eccodes \
    -DCMAKE_INSTALL_PREFIX=$TOPDIR/install \
    -DCMAKE_INSTALL_RPATH=$TOPDIR/install/lib

cd $TOPDIR
cmake --build build-ecmwf/magics --target install



# Create wheel
rm -fr dist wheelhouse ecmwflibs/share
mkdir -p install/share/magics
cp -r install/share ecmwflibs/
cp -r /usr/local/Cellar/proj/*/share ecmwflibs/
strip -S install/lib/*.dylib

./scripts/versions.sh > ecmwflibs/versions.txt
