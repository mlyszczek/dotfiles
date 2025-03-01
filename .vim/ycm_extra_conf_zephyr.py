flags = [
	'-Wall',
	'-Wextra',
	'-Werror',
	'-Wno-long-long',
	'-Wno-variadic-macros',
	'-DNDEBUG',
	'-D_GNU_SOURCE',
	'-DHAVE_CONFIG_H=1',
	'-std=c99',
	'-xc',
	'-I.',
	'-I..',
	'-Iinc',
	'-Isrc',
	'-Itst'
	'-I/usr/bofc/lib/',
	'-I/usr/bofc/include/',
	'-I/usr/local/lib/',
	'-I/usr/local/include/',
	'-I/usr/lib/',
	'-I/usr/include/',
	'-Iinclude',
	'-I../../zephyr/include',
	'-I../zephyr/include',
	'-I./include',
	'-I/home/lm-/projekty/conclusive/sunpower/mio/modules/hal/nxp/mcux/mcux-sdk/drivers/flexcan',
	'-I/home/lm-/projekty/conclusive/sunpower/mio/modules/hal/nxp/mcux/mcux-sdk/drivers/common',
	'-I/home/lm-/projekty/conclusive/sunpower/mio/modules/hal/nxp/mcux/mcux-sdk/devices/MIMXRT1062',
]

def Settings( **kwargs ):
	return { 'flags': flags }
