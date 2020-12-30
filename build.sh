#!/bin/bash

# https://www.gnu.org/software/wget/
# https://ftp.gnu.org/gnu/wget/wget2-1.99.2.tar.gz

#sudo apt-get install -y wget swig checkinstall
#wget https://ftp.gnu.org/gnu/wget/wget2-1.99.2.tar.gz
#tar -xzvf wget2-1.99.2.tar.gz
#cd wget2-1.99.2 || exit
#./configure && make && checkinstall
#rm -rf wget2-1.99.2 wget2-1.99.2.tar.gz
swig -python test_wget.i
gcc -fPIC -c test_wget.c test_wget_wrap.c -I/usr/include/python3.5
ld -shared test_wget.o test_wget_wrap.o /usr/local/lib/libwget.a -l gcrypt -lc -o _test_wget.so
rm -rf cookies.txt *.o *_wrap.c

# Python example

./main.py

sleep 5

# C example

cmake .
make
./wget_test
