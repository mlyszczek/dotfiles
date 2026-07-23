set auto-load safe-path /home/lm-/projekty/sunpower
set auto-load safe-path /usr/share/gdb
set history save on
set history remove-duplicates 1

source ~/.gdbinit-dashboard

define breakhere
	delete breakpoints
	break
end

define loopread
p /x *((uint32_t*)(0x401d8000+0x0))
p /x *((uint32_t*)(0x401d8000+0x4))
p /x *((uint32_t*)(0x401d8000+0x8))
p /x *((uint32_t*)(0x401d8000+0x10))
p /x *((uint32_t*)(0x401d8000+0x14))
p /x *((uint32_t*)(0x401d8000+0x18))
p /x *((uint32_t*)(0x401d8000+0x1C))
p /x *((uint32_t*)(0x401d8000+0x20))
p /x *((uint32_t*)(0x401d8000+0x24))
p /x *((uint32_t*)(0x401d8000+0x28))
p /x *((uint32_t*)(0x401d8000+0x2C))
p /x *((uint32_t*)(0x401d8000+0x30))
p /x *((uint32_t*)(0x401d8000+0x34))
p /x *((uint32_t*)(0x401d8000+0x38))
p /x *((uint32_t*)(0x401d8000+0x44))
p /x *((uint32_t*)(0x401d8000+0x48))
p /x *((uint32_t*)(0x401d8000+0x4C))
p /x *((uint32_t*)(0x401d8000+0x50))
p /x *((uint32_t*)(0x401d8000+0xC00))
p /x *((uint32_t*)(0x401d8000+0xC04))
p /x *((uint32_t*)(0x401d8000+0xC08))
end

define hexdump
dump binary memory /tmp/gdb-memory-dump-for-hexdump $arg0 $arg0+$arg1
shell hexdump -C /tmp/gdb-memory-dump-for-hexdump
shell unlink /tmp/gdb-memory-dump-for-hexdump
end

define bindump
dump binary memory /tmp/gdb-memory-dump-for-bindump $arg0 $arg0+$arg1
if $argc == 3
	shell ~/.gdb/bindump.sh "$arg0" /tmp/gdb-memory-dump-for-bindump $arg2
else
	shell ~/.gdb/bindump.sh "$arg0" /tmp/gdb-memory-dump-for-bindump
end
shell unlink /tmp/gdb-memory-dump-for-bindump
end

define adcdump
if $argc == 1
	bindump (0x412b0000) 0x2000 $arg0
	bindump (0x41140000+0x3000) 0x10 $arg0
	bindump (0x41140000+0x4000) 0x10 $arg0
	bindump (0x41140000+0x0002D010) 0x4 $arg0
	bindump (0x41140000+0x0002D014) 0x4 $arg0
else
	bindump (0x412b0000) 0x2000
	bindump (0x41140000+0x3000) 0x10
	bindump (0x41140000+0x4000) 0x10
	bindump (0x41140000+0x0002D010) 0x4
	bindump (0x41140000+0x0002D014) 0x4
end
end

define wdtdump
if $argc == 1
	bindump 0x411D0004 20 $arg0
	bindump 0x411D001c 4 $arg0
	bindump 0x411D0028 28 $arg0
	bindump 0x411D004c 8 $arg0
	bindump 0x411D005c 4 $arg0
else
	bindump 0x411D0004 20
	bindump 0x411D001c 4
	bindump 0x411D0028 28
	bindump 0x411D004c 8
	bindump 0x411D005c 4
end
end
