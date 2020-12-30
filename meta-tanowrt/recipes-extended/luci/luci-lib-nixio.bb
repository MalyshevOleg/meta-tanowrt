#
# SPDX-License-Identifier: MIT
#
# NIXIO POSIX library
#
# This file Copyright (c) 2019 Tano Systems LLC. All rights reserved.
# Anton Kikin <a.kikin@tano-systems.com>
#

PR = "tano0"

SUMMARY = "NIXIO POSIX library"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

DEPENDS += "lua5.1-native lua5.1 openssl virtual/crypt"

inherit cmake
inherit tanowrt-luci-lib
inherit tanowrt-lua

python __anonymous() {
    d.delVarFlag('do_configure', 'noexec')
    d.delVarFlag('do_compile', 'noexec')
}

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/patches:${THISDIR}/${PN}/files:"

SRC_URI = "${LUCI_GIT_URI};branch=${LUCI_GIT_BRANCH};protocol=${LUCI_GIT_PROTOCOL};subpath=libs/luci-lib-nixio;destsuffix=git/"
SRC_URI += "file://cmake.patch;pnum=3"
SRCREV = "${LUCI_GIT_SRCREV}"
S = "${WORKDIR}/git"

do_install_append() {
	# This installed to /usr/lib/lua/5.1/nixio by cmake
	rm -rf ${D}/usr/lib/lua/nixio
}
