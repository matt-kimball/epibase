#!/bin/sh

TIMESTAMP=$(date +%Y%m%d%H%M%S)
VERSION=0.1
PACKAGE=epibase_$VERSION-$TIMESTAMP

BINS="\
    bin/epipylon-apt-update \
    bin/epipylon-config-devel \
    bin/epipylon-resize-fs"

BOOT="\
    boot/cmdline.txt
    boot/config.txt"

SYSTEMD="\
    systemd/epipylon-apt-update.service \
    systemd/epipylon-apt-update.timer \
    systemd/epipylon-resize-fs.service"

DEBIAN="\
    debian/postinst \
    debian/prerm"

rm -fr $PACKAGE
mkdir -p $PACKAGE/DEBIAN

cat <<CONTROL_END >$PACKAGE/DEBIAN/control
Package: epibase
Version: $VERSION-$TIMESTAMP
Architecture: all
Section: admin
Priority: optional
Depends: systemd, parted
Maintainer: Matt Kimball <matt.kimball@gmail.com>
Homepage: http://www.epipylon.com/
Description: Epipylon Base System
 Base system administration tools for Epipylon
CONTROL_END

chmod a+rx $DEBIAN
cp $DEBIAN $PACKAGE/DEBIAN

mkdir -p $PACKAGE/boot
cp $BOOT $PACKAGE/boot

mkdir -p $PACKAGE/usr/sbin
cp $BINS $PACKAGE/usr/sbin

mkdir -p $PACKAGE/lib/systemd/system
cp $SYSTEMD $PACKAGE/lib/systemd/system

chown -R root.root $PACKAGE
dpkg-deb --build $PACKAGE
