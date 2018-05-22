#!/bin/bash

if [ ! -f configure ];
then
   autoreconf -i --force
fi

if [[ $(uname) != Darwin ]]; then
    export LDFLAGS="-L$PREFIX/lib"
    export CFLAGS="-fPIC -I$PREFIX/include"
fi

./configure --prefix=$PREFIX

make
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
