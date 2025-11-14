#!/bin/bash

vncserver -kill :1 >/dev/null 2>&1

mkdir -p ~/.vnc

cat > ~/.vnc/xstartup <<EOF
#!/bin/sh
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x ~/.vnc/xstartup

vncserver :1 -geometry 1280x800 -depth 24

websockify --web=/usr/share/novnc 6080 localhost:5901 &

while true; do sleep 1000; done
