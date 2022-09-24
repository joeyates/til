# Install

https://guacamole.apache.org/doc/gug/installing-guacamole.html
https://kifarunix.com/install-guacamole-on-debian-11/

## Dependencies

Ubuntu:

apt install libcairo2-dev libjpeg-turbo8-dev libpng-dev libtool-bin libossp-uuid-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libvncserver-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev

## Compile Server

./configure --with-systemd-dir=/etc/systemd/system/

make

make install

ldconfig

systemctl enable --now guacd

## Install Tomcat

apt install tomcat9 tomcat9-admin tomcat9-common tomcat9-user -y

Check Tomcat's listening port:

ss -altnp | grep 80

Open port 8080

ufw allow 8080/tcp

## Use Binary client

export VER=1.3.0
mkdir /etc/guacamole/
wget https://downloads.apache.org/guacamole/$VER/binary/guacamole-$VER.war -O /etc/guacamole/guacamole.war

## Install as a Tomcat Application

ln -s /etc/guacamole/guacamole.war /var/lib/tomcat9/webapps/

systemctl restart tomcat9 guacd

## Set up users

See "Configure Guacamole Server Connections"

# VNC Server

https://www.cyberciti.biz/faq/install-and-configure-tigervnc-server-on-ubuntu-18-04/

apt install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer

Set up VNC password:

$ vncpasswd

## Start

vncserver

## Check Status

vncserver -list

ss -tulpn | egrep -i 'vnc|590'

.vnc/zoostorm:[N].log

## Stop

vncserver -kill :1

Kill all:

vncserver -kill :*

# Guacamole

## VNC Connection

Ensure the configured port matches the port that vncserver starts.

```xml
<user-mapping>
  <!-- Per-user authentication and config information -->
  <authorize
    username="joe"
    password="MD5 password"
    encoding="md5"
  >
    <connection name="zoostorm">
      <protocol>vnc</protocol>
      <param name="hostname">127.0.0.1</param>
      <param name="port">5901</param>
      <param name="password">PASSWORD</param>
    </connection>
  </authorize>
</user-mapping>
```

http://192.168.0.15:8080

# TODO

* start vncserver on startup
