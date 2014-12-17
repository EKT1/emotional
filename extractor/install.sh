
wget http://downloads.sourceforge.net/project/opensmile/opensmile-2.0-rc1.tar.gz

tar xf opensmile-2.0-rc1.tar.gz

cd opensmile-2.0-rc1/opensmile
patch -p1 <../../plugin.patch
./buildWithInstalledPortAudio.sh

cd plugindev
autoreconf -i
./configure --enable-silent-rules --with-opensmilelib=..  --prefix=$(pwd)/../inst

make
make install
cd ../../..

#SMILEextract expects plugins to be in a folder './plugins'
ln -s opensmile-2.0-rc1/opensmile/inst/lib plugins

./opensmile-2.0-rc1/opensmile/inst/bin/SMILExtract -L


