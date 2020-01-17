out_file=../../libc++/usertime.so
#默认lua版本
#gcc -g -O2 -Wall -fPIC --shared usertime.c -o $out_file

#指定lua版本
gcc -g -O2 -Wall -fPIC -I/usr/local/include/lua5.2 --shared usertime.c -o $out_file
