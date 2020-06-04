@echo on

set GCC_ARCH=x86_64-w64-mingw32
set CC=%GCC_ARCH%-gcc
set CXX=%GCC_ARCH%-g++
set LDFLAGS=-static

REM Prepare pkg-config for libusb and make sure PKG_CONFIG_PATH is correct
md %BUILD_PREFIX%\Library\lib\pkgconfig
cp %RECIPE_DIR%/libusb-1.0.pc %BUILD_PREFIX%/Library/lib/pkgconfig/
set PKG_CONFIG_PATH=%BUILD_PREFIX%/Library/lib/pkgconfig/

bash autogen.sh
bash configure --prefix=%PREFIX%
if errorlevel 1 exit 1
make
make install
if errorlevel 1 exit 1

dfu-util --help ||true
if errorlevel 1 exit 1
