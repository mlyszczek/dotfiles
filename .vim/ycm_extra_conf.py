flags = [
	'-Wall',
	'-Wextra',
	'-Werror',
	'-Wno-long-long',
	'-Wno-variadic-macros',
	'-DNDEBUG',
	'-D_GNU_SOURCE',
	'-DHAVE_CONFIG_H=1',
	'-std=c89',
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
]

def Settings( **kwargs ):
	return { 'flags': flags }
