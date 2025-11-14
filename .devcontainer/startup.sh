#!/bin/bash

# Kill old sessions
vncserver -kill :1 >/dev/null 2>&1

# Start VNC with GUI desktop
vncserver :1 -geometry 1280x800 -depth 24

# Keep container alive
while true; do sleep 1000; done
