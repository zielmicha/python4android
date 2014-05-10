if [ ! -e Python-2.7 ]; then
    V=''
    COMPR=bz2
    wget https://www.python.org/ftp/python/2.7$V/Python-2.7$V.tar.$COMPR -O Python-2.7.tar.$COMPR
    tar xf Python-2.7.tar.$COMPR
    mv Python-2.7$V Python-2.7
fi
rm -rf build
mkdir build
cp -a Python-2.7 build/jni
(cd build/jni; patch -p1 < ../../python4bionic.patch)
cp pyconfig.h build/jni
cp Modules_config.c build/jni/Modules/config.c
cp Android.mk build/jni
cp dummy.c build/jni
