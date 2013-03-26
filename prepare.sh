if [ ! -e Python-2.7 ]; then
    wget http://www.python.org/ftp/python/2.7/Python-2.7.tar.bz2 -O Python-2.7.tar.bz2
    tar xf Python-2.7.tar.bz2
fi
rm -rf build
mkdir build
cp -a Python-2.7 build/jni
(cd build/jni; patch -p1 < ../../python4bionic.patch)
cp pyconfig.h build/jni
cp Modules_config.c build/jni/Modules/config.c
cp Android.mk build/jni
cp dummy.c build/jni
