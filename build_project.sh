#!/bin/bash
PROJECT=$1
CURDIR=`pwd`/${PROJECT}/

# This expects that this is place as a first level folder relative to the other
# OP-TEE folder in a setup using default repo configuration as described by the
# documentation in optee_os (README.md)
OPTEE_HOME=/home/jiangyikun/qemu_optee
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
cd $CURDIR/host
make CROSS_COMPILE=$HOST_CROSS_COMPILE $@


# Toolchain prefix for the Trusted Applications
TA_CROSS_COMPILE=arm-linux-gnueabihf-
# Build the Trusted Application
cd $CURDIR/ta
make O=$CURDIR/ta/out CROSS_COMPILE=$TA_CROSS_COMPILE $@