FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y wget
RUN apt-get install -y python python-setuptools python-pip
RUN apt-get install -y lsb-release netstat

RUN mkdir -p /xuma-setup
WORKDIR /xuma-setup
COPY . .

RUN wget https://raw.githubusercontent.com/xumacoin/Xuma/master/xuma_install.sh
RUN chmod +x xuma_install.sh


# TODO -
#Error: To use xumad, or the -server option to xuma-qt, you must set an rpcpassword in the configuration file:
#/root/.xuma/mainnet/xuma.conf
#It is recommended you use the following random password:
#rpcuser=xumarpc
#rpcpassword=7E6E2guhM13cw6Dsb5rVpUREE2HLBq6bEqTspWJGp357
#(you do not need to remember this password)
#The username and password MUST NOT be the same.
#If the file does not exist, create it with owner-readable-only file permissions.
#It is also recommended to set alertnotify so you are notified of problems;
#for example: alertnotify=echo %s | mail -s "Xuma Alert" admin@foo.com


RUN python setup_node_ubuntu.py