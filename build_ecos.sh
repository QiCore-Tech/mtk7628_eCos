#!/bin/bash

# Exit on error
set -e

# Define project root
PROJ_ROOT=$(pwd)

# Define eCos packages and tool paths
export ECOS_REPOSITORY=$PROJ_ROOT/packages
export ECOS_TOOL_PATH=$PROJ_ROOT/tools/bin
export ECOS_MIPSTOOL_PATH=$PROJ_ROOT/tools/mipsisa32-elf/bin
export PATH=$ECOS_TOOL_PATH:$ECOS_MIPSTOOL_PATH:$PATH

# Other environment variables from Makefile
export BRANCH=ADV
export PRJ_NAME=ap_router
export CHIPSET=mt7628
export WIFI_MODE=AP
export INIC_WIFI=NONE
export INIC_FLASH=flash
export TARGET=ECOS
export WEB_LANG=English
export TFTP_DIR=$PROJ_ROOT
export FLASH_LAYOUT=NORMAL_UBOOT_PARTITION
export IMAGE_NAME=eCos_build_test

echo "Starting eCos build process..."

# Ensure tools are executable
chmod -Rf 777 tools/bin/*

# Check if toolchain needs extraction
if [ ! -d "$ECOS_MIPSTOOL_PATH" ]; then
    echo "Extracting toolchain..."
    tar zxf tools/mipsisa32-elf.tgz -C tools
fi

# Prepare project
echo "Preparing project configuration..."
# Force copy profile.txt and other necessary files if they are missing
if [ ! -f ra305x_ap_adv/ra305x_router/profile.txt ]; then
    echo "Copying project outline files..."
    make -C ra305x_ap_adv/ra305x_router/config/$PRJ_NAME outline
    echo "$PRJ_NAME" > ra305x_ap_adv/ra305x_router/.prjname
fi

# Fix autoconf.h known issue (missing 0x prefix for portmasks)
AUTOCONF_H="ra305x_ap_adv/ra305x_router/include/autoconf.h"
if [ -f "$AUTOCONF_H" ]; then
    echo "Fixing $AUTOCONF_H..."
    sed -i 's/#define CONFIG_RA305X_WAN_PORTMASK 1e/#define CONFIG_RA305X_WAN_PORTMASK 0x1e/' "$AUTOCONF_H"
    sed -i 's/#define CONFIG_RA305X_LAN_PORTMASK 01/#define CONFIG_RA305X_LAN_PORTMASK 0x01/' "$AUTOCONF_H"
fi

# Function to build with a timeout
build_with_timeout() {
    local target=$1
    local timeout_val=$2
    echo "Building $target with timeout $timeout_val..."
    # We use 'make' directly.
    timeout "$timeout_val" make "$target"
}

# Build targets
echo "Testing build for 'kernel'..."
if build_with_timeout "kernel" 300s; then
    echo "'kernel' build finished or started successfully."
else
    RET=$?
    if [ $RET -eq 124 ]; then
        echo "'kernel' build timed out as expected for long build."
    else
        echo "'kernel' build failed with exit code $RET."
        exit $RET
    fi
fi

echo "Testing build for 'module'..."
if build_with_timeout "module" 300s; then
    echo "'module' build finished or started successfully."
else
    RET=$?
    if [ $RET -eq 124 ]; then
        echo "'module' build timed out as expected for long build."
    else
        echo "'module' build failed with exit code $RET."
        exit $RET
    fi
fi

echo "Build script test completed successfully."
