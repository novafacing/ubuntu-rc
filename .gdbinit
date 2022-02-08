source /home/novafacing/hub/pwndbg/gdbinit.py
define hook-quit
    set confirm off
end
python
import sys 
sys.path.insert(0, '/home/novafacing/.gdb') 
from printers import register_libcxx_printer_loader
register_libcxx_printer_loader()
sys.path.insert(0, '/usr/share/gcc/python/libstdcxx/')
from v6 import *
register_libstdcxx_printers(None)
end

enable pretty-printer .*
alias -a disas = disassemble
set print demangle
set print asm-demangle
source /home/novafacing/.gdb/gdb_load_rust_pretty_printers.py
