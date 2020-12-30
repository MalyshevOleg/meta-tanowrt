#
# SPDX-License-Identifier: MIT
#
# Copyright (C) 2018, 2020 Tano Systems LLC
# Author: Anton Kikin <a.kikin@tano-systems.com>
#

inherit kernel-kmod

inherit kmod/usb-net
inherit kmod/usb-wdm

#
# kmod-usb-net-qmi-wwan
# #####################
#
KERNEL_CONFIG_DEPENDS += "{\
	option            = CONFIG_USB_NET_QMI_WWAN, \
	required          = y|m, \
	m_rdepends        = kernel-module-qmi-wwan, \
	m_autoload        = qmi_wwan, \
	m_autoload_script = usb-net-qmi-wwan \
}"
