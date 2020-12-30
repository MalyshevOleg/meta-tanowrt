#
# SPDX-License-Identifier: MIT
#
# Copyright (C) 2018, 2020  Tano Systems LLC
# Author: Anton Kikin <a.kikin@tano-systems.com>
#

inherit kernel-kmod

#
# kmod-atm
# ############
#
KERNEL_CONFIG_DEPENDS += "{\
	option              = CONFIG_ATM, \
	required            = y|m, \
	m_rdepends          = kernel-module-atm, \
	m_autoload_priority = 30, \
	m_autoload          = atm, \
	m_autoload_script   = atm \
}"

KERNEL_CONFIG_DEPENDS += "{\
	option              = CONFIG_ATM_BR2684, \
	required            = y|m, \
	m_rdepends          = kernel-module-br2684, \
	m_autoload_priority = 30, \
	m_autoload          = br2684, \
	m_autoload_script   = atm \
}"
