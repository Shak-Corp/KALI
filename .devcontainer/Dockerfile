FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    kali-linux-large \
    xfce4 xfce4-goodies \
    tightvncserver \
    dbus-x11 \
    git curl wget sudo \
    mousepad xfce4-terminal \
    && apt clean

# Setup VNC password
RUN mkdir -p /root/.vnc && \
    echo "kali" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Create VNC startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

WORKDIR /workspace
