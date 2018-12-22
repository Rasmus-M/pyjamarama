xas99.py -R src/pyjamarama.a99

IF EXIST pyjamarama.dsk GOTO :dskok
xdm99.py pyjamarama.dsk --initialize DSSD -n PYJAMARAMA
:dskok

xas99.py -R -D supercart -i src/pyjamarama.a99 -o PYJA

xdm99.py pyjamarama.dsk -a PYJA
xdm99.py pyjamarama.dsk -a PYJB
xdm99.py pyjamarama.dsk -a PYJC
xdm99.py pyjamarama.dsk -a PYJD
xdm99.py pyjamarama.dsk -a PYJE

xas99.py -R -L pyramarama.lst -D supercart cartridge -i src/pyjamarama.a99 -o PYJA

java -jar tools/ea5tocart.jar PYJA "PYJAMARAMA" 0 > make.log

xas99.py -b src/cart-bank-4.a99

tools\pad.exe cart-bank-4_6100_b4.bin cart-bank-4.bin 7936

copy /b ^
PYJA8.bin + ^
empty256.bin + cart-bank-4.bin + ^
empty-2k.bin + graphics\WALLY.TIAP + ^
empty-2k.bin + graphics\WALLY.TIAC + ^
empty.bin ^
pyjamarama-8.bin

:header
java -jar tools/CopyHeader.jar pyjamarama-8.bin 60 60
