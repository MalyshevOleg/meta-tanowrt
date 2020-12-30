#
# SPDX-License-Identifier: MIT
#
# Copyright (C) 2018-2020 Anton Kikin <a.kikin@tano-systems.com>
#

def kernel_get_version(d):
    staging = d.getVar('STAGING_KERNEL_BUILDDIR', True)
    with open(staging + '/kernel-abiversion') as f:
        version = f.readline()

    return version.rstrip()

def kernel_get_config(config, d):
    import re

    staging = d.getVar('STAGING_KERNEL_BUILDDIR', True)
    with open(staging + '/.config') as f:
        lines = f.readlines()

    for line in lines:
        match = re.search(r'^' + config + '=(.*)$', line)
        if match:
            return match.group(1)

    return "n"

def kernel_version_compare(checkvalue, d):
    return bb.utils.vercmp_string(kernel_get_version(d), checkvalue)
