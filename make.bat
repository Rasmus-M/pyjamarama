xas99.py -R -L pyramarama.lst src/pyjamarama.a99

IF EXIST pyjamarama.dsk GOTO :dskok
xdm99.py pyjamarama.dsk --initialize DSSD -n PYJAMARAMA
:dskok

xas99.py -R -i src/pyjamarama.a99 -o PYJA

xdm99.py pyjamarama.dsk -a PYJA
xdm99.py pyjamarama.dsk -a PYJB
xdm99.py pyjamarama.dsk -a PYJC
xdm99.py pyjamarama.dsk -a PYJD
xdm99.py pyjamarama.dsk -a PYJE
rem xdm99.py pyjamarama.dsk -a PYJF

java -jar tools/ea5tocart.jar PYJA "PYJAMARAMA" 0 64k > make.log