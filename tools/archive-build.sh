#!/bin/bash

source ./tools/config.sh

idf_version_string=${IDF_BRANCH//\//_}"-$IDF_COMMIT"

archive_path="dist/arduino-esp32-libs-$1-$idf_version_string.tar.gz"

mkdir -p dist && rm -rf "$archive_path"
if [ -d "out" ]; then
	cd out && tar zcf "../$archive_path" * && cd ..
fi
