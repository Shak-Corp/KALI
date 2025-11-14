FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    kali-linux-large \
    xfce4 xfce4-goodies \
    tightvncserver \
    dbus-x11 \
    novnc websockify \
    git curl wget sudo \
    mousepad xfce4-terminal \
    && apt clean

# Create non-root user (GitHub Codespaces requirement)
RUN useradd -m kali && echo "kali:kali" | chpasswd && adduser kali sudo

USER kali
WORKDIR /home/kali

RUN mkdir -p ~/.vnc && \
    echo "kali" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

COPY startup.sh /home/kali/startup.sh
RUN chmod +x /home/kali/startup.sh
