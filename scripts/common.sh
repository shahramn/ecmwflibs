#!/usr/bin/env bash
set -eaux

GIT_ECBUILD=https://github.com/ecmwf/ecbuild.git
ECBUILD_VERSION=master

GIT_ECCODES=https://github.com/b8raoult/eccodes.git
ECCODES_VERSION=master

GIT_MAGICS=https://github.com/b8raoult/magics.git
MAGICS_VERSION=develop

GIT_SQLITE=https://github.com/sqlite/sqlite.git
SQLITE_VERSION=master

GIT_PROJ=https://github.com/OSGeo/PROJ.git
PROJ_VERSION=master

GIT_PIXMAN=https://github.com/freedesktop/pixman.git

PIXMAN_VERSION=master

GIT_CAIRO=https://github.com/freedesktop/cairo.git
CAIRO_VERSION=master

GIT_HARFBUZZ=https://github.com/harfbuzz/harfbuzz.git
HARFBUZZ_VERSION=master

GIT_FRIBIDI=https://github.com/fribidi/fribidi.git
FRIBIDI_VERSION=master

GIT_PANGO=https://gitlab.gnome.org/GNOME/pango.git
PANGO_VERSION=master

GIT_UDUNITS=https://github.com/b8raoult/UDUNITS-2.git
UDUNITS_VERSION=master

GIT_NETCDF=https://github.com/Unidata/netcdf-c.git
NETCDF_VERSION=master

git clone --branch $ECBUILD_VERSION --depth 1 $GIT_ECBUILD src/ecbuild
git clone --branch $ECCODES_VERSION --depth 1 $GIT_ECCODES src/eccodes
git clone --branch $MAGICS_VERSION --depth 1 $GIT_MAGICS src/magics
