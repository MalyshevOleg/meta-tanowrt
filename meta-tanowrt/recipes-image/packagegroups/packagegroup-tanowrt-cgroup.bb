# Copyright (C) 2019 Anton Kikin <a.kikin@tano-systems.com>

PR = "tano0"
SUMMARY = "Cgroup support packages"
DESCRIPTION = "The set of packages required for a cgroups support"
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup tanowrt

# packagegroup-tanowrt-cgroup
RDEPENDS_${PN} = "\
	libcgroup \
	libcgroup-procd \
	kmod-cgroups \
"
