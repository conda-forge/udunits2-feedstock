#!/bin/bash

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

for EXT in sh csh fish
do
  cp $RECIPE_DIR/scripts/activate.$EXT $ACTIVATE_DIR/udunits2-activate.$EXT
  cp $RECIPE_DIR/scripts/deactivate.$EXT $DEACTIVATE_DIR/udunits2-deactivate.$EXT
done

# We can remove this when we start using the new conda-build.
find $PREFIX -name '*.la' -delete
