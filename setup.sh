#!/bin/bash

echo "Installing Rubygems"
sudo apt-get install rubygems

mkdir orocos-toolchain
cd orocos-toolchain

echo "Installing ruby"
sudo apt-get install ruby1.9.1

echo "Pulling bootstrap"
wget -O bootstrap-2.6.sh http://gitorious.org/orocos-toolchain/build/raw/toolchain-2.6:bootstrap.sh
echo "Running bootstrap script"
bash bootstrap-2.6.sh

echo "installing hoe gem"
gem install hoe

echo "editing Rakefile"
touch utilrb/temp.txt
(sed '27s/Utilrb.doc/#Utilrb.doc/' utilrb/Rakefile) > utilrb/temp.txt
rm utilrb/Rakefile
mv utilrb/temp.txt Rakefile
echo "Removing autoproj directory and script"
sudo rm -r autoproj

update-alternatives --set ruby /usr/bin/ruby1.9.1

echo "Building edited bootstrap script"
sudo bash bootstrap-2.6.sh

chmod 777 env.sh
source ./env.sh

echo "Editing .bashrc"
echo "source ~/Exoskeleton/orocos/orocos-toolchain/env.sh" >> ~/.bashrc

echo "Try running:"
echo "  deployer-gnulinux"
echo "  typegen"
echo ""
echo "to make sure orocos compiled correctly"
