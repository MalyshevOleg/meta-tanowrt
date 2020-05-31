#
# Copyright (C) 2020, Tano Systems, All rights reserved
# Authors: Anton Kikin <a.kikin@tano-systems.com>
#
SECTION = "kernel"
DESCRIPTION = "Linux kernel for NXP QorIQ platforms"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"

# Look in the generic major.minor directory for files
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"

# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
MACHINE_KERNEL_PR_append = "tano1"
PR = "${MACHINE_KERNEL_PR}"

KERNEL_SRC_URI ?= "git://source.codeaurora.org/external/qoriq/qoriq-components/linux;nobranch=1"
KERNEL_SRC_BRANCH ?= ""
KERNEL_SRC_SRCREV ?= "4aba815fd6404a9620a66c8a3c2af4ba2a6a701a"

LINUX_VERSION ?= "4.19.68"
LINUX_KERNEL_TYPE ?= "standard"
PV = "${LINUX_VERSION}+git${SRCPV}"

LINUX_VERSION_FULL = "${@kernel_full_version("${LINUX_VERSION}")}"
LINUX_VERSION_SHORT = "${@oe.utils.trim_version("${LINUX_VERSION}", 2)}"

require recipes-kernel/linux/tano-kernel-cache-4.19.inc
require recipes-kernel/linux/linux-tano-qoriq.inc
require recipes-kernel/linux/linux-tano.inc
