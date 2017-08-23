
#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

echo "Your system: ${machine}"
echo ""

if [ ${machine} = Linux ] ; then
	echo "--Install ansible for debian system--"
	apt-get install software-properties-common -y 
	apt-add-repository ppa:ansible/ansible -y
	apt-get update
	apt get install ansible -y 
	echo "Successful"
	ansible --version

elif [ ${machine} = Cygwin ] ; then
	#---Install soft
	lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
	install apt-cyg /bin
	#----------------
	apt-cyg install wget curl git nano make openssh binutils gmp \
	openssl \
	openssl-devel \
	python \
	python-crypto \
	python-jinja2 \
	python-setuptools \
	python-openssl \
	python-devel \
	python2 \
	python2-cryptography \
	python2-openssl \
	python2-pip \
	python2-setuptools \
	python2-yaml \


	python2-paramiko


	libffi-devel \
 	gcc-core gcc-g++ \
 	libgmp-devel   
  
	#----------------

	git nano openssh openssl openssl-devel libffi-devel gcc-core gcc-g++
	git clone --depth 1 git://github.com/ansible/ansible
	cd ansible
	PATH+=:~+/bin
	export PYTHONPATH=~+/lib
	ansible --version
fi









#!/bin/bash
#type apt-cyg || exit
#apt-cyg install git python-{jinja2,six,yaml}
#git clone --depth 1 git://github.com/ansible/ansible
#cd ansible
#PATH+=:~+/bin
#export PYTHONPATH=~+/lib
#ansible --version