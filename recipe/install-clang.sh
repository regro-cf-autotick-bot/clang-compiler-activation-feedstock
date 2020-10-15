#!/bin/bash

set -e -x

CHOST=${macos_machine}

mkdir -p "${PREFIX}"/etc/conda/{de,}activate.d/
cp "${SRC_DIR}"/activate-clang.sh "${PREFIX}"/etc/conda/activate.d/activate_"${PKG_NAME}".sh
cp "${SRC_DIR}"/deactivate-clang.sh "${PREFIX}"/etc/conda/deactivate.d/deactivate_"${PKG_NAME}".sh

pushd "${PREFIX}"/bin
  ln -s clang ${CHOST}-clang
  if [[ "${CBUILD}" != ${CHOST} ]]; then
    ln -s clang ${CBUILD}-clang
  fi
popd
