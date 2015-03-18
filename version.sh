#!/bin/sh
#
ARCH=$(uname -m)
CORES=$(getconf _NPROCESSORS_ONLN)

#Debian 7 (Wheezy): git version 1.7.10.4 and later needs "--no-edit"
unset git_opts
git_no_edit=$(LC_ALL=C git help pull | grep -m 1 -e "--no-edit" || true)
if [ ! "x${git_no_edit}" = "x" ] ; then
	git_opts="--no-edit"
fi

config="omap2plus_defconfig"

build_prefix="ti"
branch_prefix=""

#toolchain="gcc_linaro_eabi_4_8"
#toolchain="gcc_linaro_eabi_4_9"
#toolchain="gcc_linaro_gnueabi_4_6"
toolchain="gcc_linaro_gnueabihf_4_7"
#toolchain="gcc_linaro_gnueabihf_4_8"
#toolchain="gcc_linaro_gnueabihf_4_9"

#Kernel/Build
KERNEL_REL=3.8
KERNEL_TAG=${KERNEL_REL}.13
BUILD=${build_prefix}-r1

#v3.X-rcX + upto SHA
#prev_KERNEL_SHA=""
#KERNEL_SHA=""

#git branch
BRANCH="ti-linux-${branch_prefix}3.8.y"

DISTRO=cross
DEBARCH=armhf

ti_git_old_release="4f116c97e84d0a35f29977a6f4d1e3dd9e438eae"
ti_git_pre="4f116c97e84d0a35f29977a6f4d1e3dd9e438eae"
ti_git_post="4f116c97e84d0a35f29977a6f4d1e3dd9e438eae"
#
