FROM kalilinux/kali-rolling

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update + install full Kali with GUI + major tools
RUN apt update && apt full-upgrade -y && \
    apt install -y \
        kali-linux-large \
        xfce4 xfce4-goodies \
        tightvncserver dbus-x11 \
        git curl wget sudo \
        metasploit-framework \
        burpsuite \
        seclists \
        wordlists \
        net-tools \
        mousepad xfce4-terminal && \
    apt clean

# Setup VNC password
RUN mkdir -p /root/.vnc && \
    echo "kali" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Extract rockyou
RUN gzip -d /usr/share/wordlists/rockyou.txt.gz || true

# Copy startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

WORKDIR /workspace
