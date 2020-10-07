#!/bin/bash
#
#EXTRACT FILES
#{{{
echo "createing temporary files..."
DIR="/tmp/PacketTracer/"
if [ -d "$DIR" ]; then
        rm -rf "$DIR"
else
        mkdir /tmp/PacketTracer/
fi
cp PacketTracer_731_amd64.deb /tmp/PacketTracer/
cd /tmp/PacketTracer/
ar -xv PacketTracer_731_amd64.deb
mkdir control
tar -C control -Jxf control.tar.xz
mkdir data
tar -C data -Jxf data.tar.xz
cd data
#}}}
#
#REMOVE PREVIOUS VERSION
#{{{
rm -rf /opt/pt
rm -rf /usr/share/applications/cisco-pt7.desktop
rm -rf /usr/share/applications/cisco-ptsa7.desktop
rm -rf /usr/share/icons/gnome/48x48/mimetypes/pka.png
rm -rf /usr/share/icons/gnome/48x48/mimetypes/pkt.png
rm -rf /usr/share/icons/gnome/48x48/mimetypes/pkz.png
rm -rf /usr/share/mime/packages/cisco-pka.xml
rm -rf /usr/share/mime/packages/cisco-pkt.xml
rm -rf /usr/share/mime/packages/cisco-pkz.xml
#}}}
#
#COPY FILES USR,OPT
#{{{
cp -r usr /
cp -r opt /
#}}}
#
#Setup The Desktop
#{{{
xdg-desktop-menu install /usr/share/applications/cisco-pt7.desktop
xdg-desktop-menu install /usr/share/applications/cisco-ptsa7.desktop
update-mime-database /usr/share/mime
gtk-update-icon-cache --force --ignore-theme-index /usr/share/icons/gnome
xdg-mime default cisco-ptsa7.desktop x-scheme-handler/pttp
#}}}
#
#Remove temporary files
#{{{
rm -rf /tmp/PacketTracer/
#}}}
#
#It's done
#{{{
echo ""
echo "Press <ENTER> to continue..."
echo ""
read 
echo "Bye!Bye!"
echo ""
echo ""
#}}}
