#!/bin/zsh


# $1 is a prefix for all the model related files
#
# $1.lsvm should contain all feature vectors.

A=${1:-np}

[[ -e $A.lsvm ]] || ( echo "No file $A.lsvm" ; exit 1 )

D=`pwd`/$A


# Create the `test` and `training` sets.
sort -R <${A}.lsvm >tmp.lsvm
head -n100 tmp.lsvm > ${A}-test.lsvm
tail -n +100 tmp.lsvm | sort > ${A}-train.lsvm
rm tmp.lsvm


# Run SVM
pushd ../libsvm/tools
./easy.py $D-train.lsvm
../svm-scale -r $A-train.lsvm.range $D-test.lsvm >$A-test.lsvm.scale
../svm-predict $A-test.lsvm.scale $A-train.lsvm.model $A-test.txt
paste $A-test.txt $A-test.lsvm.scale >$D-testx.txt
popd
mv ../libsvm/tools/$A-* .

