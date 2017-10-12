#!/bin/bash
sudo rm -rf /tmp/*

sudo mkdir -p /root/.vnc

echo $VNCPASS | vncpasswd -f > /home/atlauncher/.vnc/passwd

vncserver :1 -geometry 1280x800 -depth 24
