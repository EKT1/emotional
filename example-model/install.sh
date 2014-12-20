
wget http://peeter.eki.ee:5010/example-model.tgz
tar xf example-model.tgz

mv interest/* .

#SMILEextract expects plugins to be in a folder './plugins'

ln -s ../extractor/opensmile-2.0-rc1/opensmile/inst/lib plugins

#../extractor/opensmile-2.0-rc1/opensmile/inst/bin/SMILExtract -L

