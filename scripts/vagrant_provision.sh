#!/bin/bash


echo "=== installing system packages ==="
sudo apt-get update -qq -y
sudo apt-get install -qq -y git wget vim nano build-essential pkg-config mercurial subversion
sudo apt-get install gnupg-agent
echo "=== done ==="

echo "=== installing go lang tools ==="
wget --quiet https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xzf go1.3.1.linux-amd64.tar.gz

sudo echo "export GOROOT=/usr/local/go" >> /etc/profile
sudo echo "export GOPATH=/usr/local/gopath" >> /etc/profile
sudo echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
sudo echo "export PATH=$PATH:/usr/local/gopath/bin" >> /etc/profile

sudo mkdir /usr/local/gopath/{src,bin,pkg}
sudo chown -R vagrant:root /usr/local/gopath
sudo ln -s /vagrant /usr/local/gopath/src/github.com/oleiade/trousseau

rm -rf go1.3.1.linux-amd64.tar.gz
echo "=== done ==="


echo "=== import test gpg keys ==="
gpg --import scripts/testkeys/trousseau_test_key_pub.gpg
gpg --allow-secret-key-import --import scripts/testkeys/trousseau_test_key_sec.gpg
echo "=== done ==="


echo "=== building trousseau ==="
make
echo "=== done ==="

echo "Your box is ready to use, enjoy!"
