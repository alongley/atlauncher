#!/bin/bash
#This script is  for initial set up of the vnc server
#Creation date: April 2017
#########################################################################
# set the user and password below or accept default values below
# password is the user's OS password _not_ the VNC password
user=vnc               # your chosen vnc user name, the service runs as this user
password="passpops"    # your chosen OS password for the vnc user
#
# encrypt password so it can be passed in -p to useradd
mypass=`perl -e 'printf("%s\n", crypt($ARGV[0], "password"))' "$password"`
useradd -m -p $mypass -s /bin/bash $user
gpasswd -a $user sudo
export HOME=/home/$user
export USER=$user
#
#apt-get update
#apt-get install tightvncserver -y
#apt-get install --no-install-recommends -y xfce4 xfce4-goodies
# install chrome
#apt-get install libappindicator1 -y
#apt-get install fonts-liberation -y
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#dpkg -i google-chrome-stable_current_amd64.deb
#
umask 0077                                        # use safe default permissions
mkdir -p "$HOME/.vnc"                             # create config directory
chmod go-rwx "$HOME/.vnc"                         # enforce safe permissions
#nohup vncserver &
cp /tmp/startvncserver.sh ~
cp /tmp/entrypoint.sh ~
chown -R $user:$user "$HOME"
#
exit 0