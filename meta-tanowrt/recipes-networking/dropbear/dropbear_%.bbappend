# This file Copyright (C) 2018-2020 Anton Kikin <a.kikin@tano-systems.com>

PR_append = ".tano4.${INC_PR}"

RCONFLICTS_${PN} = "openssh-sshd openssh"
RDEPENDS_${PN}-dev = ""

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/files:${THISDIR}/${PN}/patches:"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}_${PV}/files:${THISDIR}/${PN}_${PV}/patches:"

require ${PN}-openwrt.inc
