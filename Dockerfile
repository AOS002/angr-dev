from ubuntu:focal
maintainer yans@yancomm.net

arg DEBIAN_FRONTEND=noninteractive
arg BRANCH=master

run dpkg --add-architecture i386
run apt-get update &&									\
	apt-get install -y virtualenvwrapper python3-dev python3-pip build-essential libxml2-dev libxslt1-dev git libffi-dev cmake libreadline-dev libtool debootstrap debian-archive-keyring libglib2.0-dev libpixman-1-dev qtdeclarative5-dev binutils-multiarch nasm libc6:i386 libgcc1:i386 libstdc++6:i386 libtinfo5:i386 zlib1g:i386 vim libssl-dev openjdk-8-jdk

run useradd -s /bin/bash -m angr

run su - angr -c "git clone https://github.com/angr/angr-dev -b $BRANCH && cd angr-dev && ./setup.sh -w -e angr && ./setup.sh -w -p angr-pypy"
run su - angr -c "echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> /home/angr/.bashrc && echo 'workon angr' >> /home/angr/.bashrc"
cmd su - angr
