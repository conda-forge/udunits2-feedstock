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
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-0}" != "1" ]]; then
    make check
fi
