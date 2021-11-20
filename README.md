## Script for installing Cisco Packet Tracer 7.3.1 

###### VOID-LINUX

- PREREQUISITES

1. PacketTracer_731_amd64.deb - [NETACAD](netacad.com)
1. xz - The XZ compression utilities
1. xdg-utils - Tools to assist applications with various desktop integration tasks
1. binutils - for ar 

***************************************************************************************************

##### Download the script - make sure the PacketTracer_731_amd64.deb and the install script is in the same folder

```bash
wget https://raw.githubusercontent.com/p0txky/void-packettracer/master/install_pt.sh
```

**TO INSTALL**

```bash
sudo bash install_pt.sh
```

**TO RUN**

```bash
/opt/pt/packettracer
```

**You can do symbolic link using**

```bash
sudo ln -s /opt/pt/packettracer /usr/local/bin/packettracer
```

**TO REMOVE**

if you use symlink remove it:

```bash
sudo rm /usr/local/bin/packettracer
```

then:

```bash
sudo bash uninstall.sh
```
