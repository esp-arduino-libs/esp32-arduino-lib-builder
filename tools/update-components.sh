#/bin/bash

source ./tools/config.sh

#
# CLONE/UPDATE TINYUSB
#
echo "Updating TinyUSB..."
TINYUSB_REPO_URL="https://github.com/hathach/tinyusb.git"
TINYUSB_REPO_DIR="$AR_COMPS/arduino_tinyusb/tinyusb"
if [ ! -d "$TINYUSB_REPO_DIR" ]; then
    git clone "$TINYUSB_REPO_URL" "$TINYUSB_REPO_DIR"
	git -C "$TINYUSB_REPO_DIR" checkout --recurse-submodules ${TINYUSB_REPO_COMMIT} && \
    git -C "$TINYUSB_REPO_DIR" submodule update --init --recursive
else
	git -C "$TINYUSB_REPO_DIR" fetch && \
	git -C "$TINYUSB_REPO_DIR" checkout --recurse-submodules ${TINYUSB_REPO_COMMIT} && \
    git -C "$TINYUSB_REPO_DIR" submodule update --init --recursive
fi
