class XXD(gdb.Command):
  def __init__(self):
    super(XXD, self).__init__("xxd", gdb.COMMAND_USER)

  def _PrintLine(self, offset, bytes, size):
      print('{:08x}: '.format(offset), end='')
      todo = size
      while todo >= 4:
        print(''.join('{:02x}'.format(b) for b in bytes[0:4]), end='')
        todo -= 4
        bytes = bytes[3:]
        if todo:
          print(' ', end='')

      # Print any remaining bytes
      print(''.join('{:02x}'.format(b) for b in bytes[0:todo]), end='')

      print()
      return size

  def invoke(self, arg, from_tty):
    args = arg.split()
    if len(args) != 2:
      print("xxd: <addr> <count>")
      return
    size = int(args[1])
    addr = gdb.parse_and_eval(args[0])
    inferior = gdb.inferiors()[0]
    bytes = inferior.read_memory(addr, size).tobytes()

    offset = int(addr)
    while size > 0:
      n = self._PrintLine(offset, bytes, min(len(bytes), 16))
      size -= n
      offset += n
      bytes = bytes[n:]

XXD()
