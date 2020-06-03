#!/bin/sh
set -ex

if [ $TRAVIS_ARCH == "s390x" ];
then
  sudo apt-get install phantomjs;
  export QT_QPA_PLATFORM=offscreen;
  wget https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.5.4/apache-maven-3.5.4-bin.tar.gz;
  tar -xzf apache-maven-3.5.4-bin.tar.gz;
  export PATH=$PWD/apache-maven-3.5.4/bin:$PATH;
else
  export PHANTOMJS_VERSION=2.1.1;
  phantomjs --version;
  export PATH=$PWD/travis_phantomjs/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin:$PATH;
  phantomjs --version;
  if [ $(phantomjs --version) != '$PHANTOMJS_VERSION' ]; then rm -rf $PWD/travis_phantomjs; mkdir -p $PWD/travis_phantomjs; fi;
  if [ $(phantomjs --version) != '$PHANTOMJS_VERSION' ]; then wget https://github.com/Medium/phantomjs/releases/download/v$PHANTOMJS_VERSION/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -O $PWD/travis_phantomjs/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2; fi;
  if [ $(phantomjs --version) != '$PHANTOMJS_VERSION' ]; then tar -xvf $PWD/travis_phantomjs/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C $PWD/travis_phantomjs; fi;
  phantomjs --version;
fi
