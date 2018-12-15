xas99.py -R -L pyramarama.lst src/pyjamarama.a99

xas99.py -R -i src/pyjamarama.a99 -o PYJA

java -jar tools/ea5tocart.jar PYJA "PYJAMARAMA" 0 64k > make.log