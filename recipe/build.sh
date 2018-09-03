#!/bin/bash

autoreconf -vfi

export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"
export CFLAGS="${CFLAGS} -I${PREFIX}/include"

if [[ $(uname) == Darwin ]]; then
  export LDFLAGS="${LDFLAGS} -Wl,-rpath,${PREFIX}/lib"
fi

./configure --prefix=${PREFIX}  \
            --enable-static     \
            --enable-shared
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install

if [[ $(uname) == Darwin ]]; then
    cp ${RECIPE_DIR}/patchbinary.py ${PREFIX}/
    echo ${PREFIX} > ${PREFIX}/build_prefix.a
fi

# Make sure ENV variables and set
ACTIVATE_DIR=$PREFIX/etc/conda/activate.d
DEACTIVATE_DIR=$PREFIX/etc/conda/deactivate.d
mkdir -p $ACTIVATE_DIR
mkdir -p $DEACTIVATE_DIR

cp $RECIPE_DIR/scripts/activate.sh $ACTIVATE_DIR/udunits2-activate.sh
cp $RECIPE_DIR/scripts/deactivate.sh $DEACTIVATE_DIR/udunits2-deactivate.sh

# We can remove this when we start using the new conda-build.
find $PREFIX -name '*.la' -delete
