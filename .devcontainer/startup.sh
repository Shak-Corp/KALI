#!/bin/bash

# Kill existing VNC
vncserver -kill :1 >/dev/null 2>&1

# Configure XFCE
cat > /root/.vnc/xstartup <<EOF
#!/bin/sh
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x /root/.vnc/xstartup

# Start VNC on :1
vncserver :1 -geometry 1280x800 -depth 24

# Start noVNC (port 6080 → VNC 5901)
websockify --web=/usr/share/novnc 6080 localhost:5901 &

# Keep container running
while true; do sleep 1000; done
