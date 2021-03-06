#! /bin/bash
echo "Building somelib.o"
gcc -c -Os somelib.c -o somelib.o
echo "Building someotherlib.o"
gcc -c -Os someotherlib.c -o someotherlib.o
echo "ar'ing somelib.a"
ar rcs somelib.a somelib.o someotherlib.o
echo "Building usesomelib"
gcc -O0 -o usesomelib notalib.c somelib.a
cp usesomelib usesomelib-stripped
echo "Stripping usesomelib-stripped"
strip usesomelib-stripped
# Generates collisions ~/Downloads/flair695/bin/linux/pelf -v -f somelib.a
echo "pelf'ing somelib.a"
~/Downloads/flair695/bin/linux/pelf -v somelib.a
echo "sigmake'ing somelib.sig"
~/Downloads/flair695/bin/linux/sigmake -X somelib.pat somelib.sig
echo "sigdump'ing somelib.sig"
~/Downloads/flair695/bin/linux/dumpsig -X somelib.sig somelib.sigdump
