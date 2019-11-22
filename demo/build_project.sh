#!/bin/bash

# usage:
# run ./build_project: remove files which have been previouly compiled in /ta/out/
# run ./build_project $1: not to remove folder /ta/out/  ($1 could be any string)

CURDIR=`pwd`


# OPTEE HOME
OPTEE_HOME=~/qemu_optee
echo "[*] optee home is ${OPTEE_HOME}"
echo ""

# clean the project
echo "[*] project make clean..."
echo ""
make clean
echo ""
echo "[*] project make clean done!"
echo ""

# remove the ta files in /ta/out/
if [ -z $1 ];then
    echo ""
    echo "[*] remove files in /ta/out/..."
    echo ""
    rm -rf ta/out/
    echo ""
    echo "[*] remove files done!"
    echo ""
fi

# ROOT=`dirname $ROOT`

# Path to the toolchain
export PATH=${OPTEE_HOME}/toolchains/aarch32/bin:$PATH

# Path to the TA-DEV-KIT coming from optee_os
export TA_DEV_KIT_DIR=${OPTEE_HOME}/optee_os/out/arm/export-ta_arm32

# Path to the client library (GP Client API)
export TEEC_EXPORT=${OPTEE_HOME}/optee_client/out/export

export PLATFORM=vexpress-qemu_virt
#export PLATFORM_FLAVOR=qemu_virt

# Toolchain prefix for user space code (normal world)
HOST_CROSS_COMPILE=arm-linux-gnueabihf-


# Build the host application
echo ""
echo "[*] make CA..."
echo ""
cd $CURDIR/host
make CROSS_COMPILE=$HOST_CROSS_COMPILE TEEC_EXPORT=${OPTEE_HOME}/optee_client/out/export/usr \
    --no-builtin-variables
echo ""
echo "[*] make CA done!"
echo ""


# Toolchain prefix for the Trusted Applications
TA_CROSS_COMPILE=arm-linux-gnueabihf-
# Build the Trusted Application
echo ""
echo "[*] make TA..."
echo ""
cd $CURDIR/ta
make O=$CURDIR/ta/out CROSS_COMPILE=$TA_CROSS_COMPILE PLATFORM=${PLATFORM} \
    TA_DEV_KIT_DIR=${OPTEE_HOME}/optee_os/out/arm/export-ta_arm32
echo ""
echo "[*] make TA done!"

