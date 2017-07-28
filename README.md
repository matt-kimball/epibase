# Overview

epibase is part of Epipylon -- http://www.epipylon.com/

epibase contains basic scripts and boot configuration necessary
for Epipylon's basic operation.

# Contents

epibase contains the following components:

* `bin/epipylon-apt-update` - Automatic package updating
* `bin/epipylon-config-raspbian` - Add Raspbian as a package source
* `bin/epipylon-resize-fs` - Resize the root filesystem to SD card size
* `boot/` - Bootloader configuration
* `debian/` - Scripts related to package installation
* `systemd/` - Systemd configuration to script invocation

# Development

The first step in development is installing the Epipylon development
image on your Raspberry Pi.

See http://www.epipylon.com/index.html#development for the development
image.

After installation, log in to your Raspberry Pi and clone the epibase
repository.

    ssh epipylon@epipylon.local  # password is 'epipylon'
    git clone https://github.com/matt-kimball/epibase.git
    cd epibase

After you've made changes, you can install them as follows:

    sudo ./package.sh
    sudo dpkg -i epibase_0.1-XXXX.deb  # where XXXX is the package timestamp

The `clean.sh` script can be used to remove all built packages.

# License

epibase is licensed under the GNU General Public License 2.0.
