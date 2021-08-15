#! /bin/bash  -xue

echo  Provisioning  ${USER} for ${HOSTNAME}
test  -f  ${HOME}/.provision.user  &&  exit 0

for srcDir in  /tmp/VagrantConfig  /tmp/data/home/vagrant  ; do
    if  test -d ${srcDir} ; then
        chmod  -R   go-rwx  ${srcDir}
        rsync  -av  ${srcDir}/  ${HOME}/
    fi
done

if  test -d ${HOME}/.ssh ; then
    chmod  -R   go-rwx  ${HOME}/.ssh/
    chmod  700  ${HOME}/.ssh
fi

# CPPUNIT
mkdir  /tmp/build
pushd  /tmp/build
tar    -xzvf  /tmp/data/cppunit-1.15.1.tar.gz
cd     cppunit-1.15.1/
./configure  --prefix=/tools/cppunit/1.15.1  \
    &&  make  &&  make  install
popd

date  >  ${HOME}/.provision.user
