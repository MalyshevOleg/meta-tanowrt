# This file Copyright (C) 2018, 2020 Anton Kikin <a.kikin@tano-systems.com>

DEPENDS += "luasrcdiet-native"

LUASRCDIET_PATHS ?= "${D}/usr/lib/lua/5.1"
LUASRCDIET_ENABLE ?= "1"

luasrcdiet_process() {
	for p in "${LUASRCDIET_PATHS}"; do
		find "$p" -type f -name '*.lua' | while read src; do
			if LUA_PATH=${STAGING_DIR_NATIVE}/usr/lib/lua/5.1/?.lua luasrcdiet --noopt-binequiv -o "$src.o" "$src"; then
				mv "$src.o" "$src"
			fi
		done
	done
}

do_install[postfuncs] += "${@oe.utils.conditional('LUASRCDIET_ENABLE', '1', 'luasrcdiet_process', '', d)}"
