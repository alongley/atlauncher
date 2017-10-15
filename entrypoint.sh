#!/bin/bash
rm -rf /tmp/.X1*
#echo $VNCPASS | vncpasswd -f > /home/atlauncher/.vnc/passwd
export USER=vnc
vncserver :1 -geometry 1280x800 -depth 24

## Keep the container going
tail -F -n0 /etc/hosts