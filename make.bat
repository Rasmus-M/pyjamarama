IF EXIST pyjamarama.dsk GOTO :dskok
xdm99.py pyjamarama.dsk --initialize DSSD -n PYJAMARAMA
:dskok

REM Object file

xas99.py -R -q -L pyramarama32k.lst src/pyjamarama.a99

REM E/A#5 for 32K only

xas99.py -R -i -q src/pyjamarama.a99 -o bin/PYJA1

xdm99.py pyjamarama.dsk -a bin/PYJA1
xdm99.py pyjamarama.dsk -a bin/PYJA2
xdm99.py pyjamarama.dsk -a bin/PYJA3
xdm99.py pyjamarama.dsk -a bin/PYJA4

REM E/A#5 for 32K + Supercart

xas99.py -R -q -D supercart -i src/pyjamarama.a99 -o bin/PYJASC1

xdm99.py pyjamarama.dsk -a bin/PYJASC1
xdm99.py pyjamarama.dsk -a bin/PYJASC2
xdm99.py pyjamarama.dsk -a bin/PYJASC3
xdm99.py pyjamarama.dsk -a bin/PYJASC4
xdm99.py pyjamarama.dsk -a bin/PYJASC5

REM Cartridge + 32K

xas99.py -R -q -L pyramarama.lst -D supercart cartridge -i src/pyjamarama.a99 -o bin/PYJA

java -jar tools/ea5tocart.jar bin/PYJA "PYJAMARAMA" 0 > make.log

xas99.py -q -b -o bin/cart-bank-4 src/cart-bank-4.a99

tools\pad.exe bin\cart-bank-4 bin\cart-bank-4.bin 7936

copy /b ^
bin\PYJA8.bin + ^
bin\empty256.bin + bin\cart-bank-4.bin + ^
bin\empty-2k.bin + graphics\WALLY.TIAP + ^
bin\empty-2k.bin + graphics\WALLY.TIAC + ^
bin\empty.bin ^
pyjamarama-8.bin

java -jar tools/CopyHeader.jar pyjamarama-8.bin 60 60

WHERE jar
@IF %ERRORLEVEL% NEQ 0 GOTO :end
jar -cvf pyjamarama.rpk pyjamarama-8.bin layout.xml > make.log

:end
