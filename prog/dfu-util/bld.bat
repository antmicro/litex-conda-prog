@echo on

bash autogen.sh
bash configure --prefix=%PREFIX%
make
make install

dfu-util --help ||true
