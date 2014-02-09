#!/bin/bash

echo "Installing rubygems"
sudo apt-get install rubygems

mkdir orocos
cd orocos
mkdir orocos-toolchain
cd orocos-toolchain

gem install hoe

echo "Pulling bootstrap"
wget -O bootstrap-2.6.sh http://gitorious.org/orocos-toolchain/build/raw/toolchain-2.6:bootstrap.sh
echo "Running bootstrap script"
bash bootstrap-2.6.sh

echo "editing Rakefile"
sed '27s/Utilrb.doc/#Utilrb.doc/' utilrb/Rakefile
echo "Building edited bootstrap script"
bash bootstrap-2.6.sh

source env.sh
echo "Editing .bashrc"
echo "./orocos/orocos-toolchain/env.sh" >> ~/.bashrc

echo "Try running:"
echo "  deployer-gnulinux"
echo "  typegen"
echo ""
echo "to make sure orocos compiled correctly"
