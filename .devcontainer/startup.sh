#!/bin/bash

# Kill session if exists
vncserver -kill :1 >/dev/null 2>&1

# Start XFCE desktop session
echo "#!/bin/sh
xrdb \$HOME/.Xresources
startxfce4 &" > /root/.vnc/xstartup
chmod +x /root/.vnc/xstartup

# Start VNC
vncserver :1 -geometry 1280x800 -depth 24

# Keep alive
while true; do sleep 1000; done
