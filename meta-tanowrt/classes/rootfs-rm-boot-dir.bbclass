#
# SPDX-License-Identifier: MIT
#
# Remove from rootfs /boot folder
#
ROOTFS_POSTPROCESS_COMMAND += "rootfs_rm_boot_dir; "

ROOTFS_RM_BOOT_DIR_DISABLE  ?= "0"
ROOTFS_RM_BOOT_DIR_KEEP_DTB ?= "0"

rootfs_rm_boot_dir() {
	if [ "${ROOTFS_RM_BOOT_DIR_DISABLE}" = "0" ]; then
		if [ -d ${IMAGE_ROOTFS}/boot ]
		then
			if [ "${ROOTFS_RM_BOOT_DIR_KEEP_DTB}" = "0" ]; then
				rm -rf ${IMAGE_ROOTFS}/boot
				bbnote "Removed /boot from root filesystem"
			else
				rm -f `ls -1 -d ${IMAGE_ROOTFS}/boot/* | grep -v ".*\.dtb.*$"`
				bbnote "Removed all data (except *.dtb) from /boot on root filesystem"
			fi
		fi
	fi
}
