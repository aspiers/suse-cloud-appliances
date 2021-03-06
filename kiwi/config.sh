#!/bin/bash
#================
# FILE          : config.sh
#----------------
# PROJECT       : OpenSuSE KIWI Image System
# COPYRIGHT     : (c) 2006 SUSE LINUX Products GmbH. All rights reserved
#               :
# AUTHOR        : Marcus Schaefer <ms@suse.de>
#               :
# BELONGS TO    : Operating System images
#               :
# DESCRIPTION   : configuration script for SUSE based
#               : operating systems
#               :
#               :
# STATUS        : BETA
#----------------
#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$name]..."

#======================================
# SuSEconfig
#--------------------------------------
echo "** Running suseConfig..."
suseConfig

echo "** Running ldconfig..."
/sbin/ldconfig

#======================================
# Setup baseproduct link
#--------------------------------------
suseSetupProduct


#======================================
# Setup default runlevel
#--------------------------------------
baseSetRunlevel 3

#======================================
# Add missing gpg keys to rpm
#--------------------------------------
suseImportBuildKey


#======================================
# Sysconfig Update
#--------------------------------------
echo '** Update sysconfig entries...'
baseUpdateSysConfig /etc/sysconfig/keyboard KEYTABLE english-us
baseUpdateSysConfig /etc/sysconfig/network/config FIREWALL no
baseUpdateSysConfig /etc/sysconfig/network/config NETWORKMANAGER no
baseUpdateSysConfig /etc/sysconfig/SuSEfirewall2 FW_SERVICES_EXT_TCP 22\ 80\ 443
baseUpdateSysConfig /etc/sysconfig/console CONSOLE_FONT lat9w-16.psfu
baseUpdateSysConfig /etc/sysconfig/displaymanager DISPLAYMANAGER xdm
baseUpdateSysConfig /etc/sysconfig/windowmanager DEFAULT_WM icewm-session


#======================================
# Setting up overlay files 
#--------------------------------------
echo '** Setting up overlay files...'
mkdir -p /etc/YaST2/
mv /studio/overlay-tmp/files//etc/YaST2//firstboot-standard.xml /etc/YaST2//firstboot-standard.xml
chown root:root /etc/YaST2//firstboot-standard.xml
chmod 644 /etc/YaST2//firstboot-standard.xml
mkdir -p /etc/YaST2/
mv /studio/overlay-tmp/files//etc/YaST2//firstboot-embedded.xml /etc/YaST2//firstboot-embedded.xml
chown root:root /etc/YaST2//firstboot-embedded.xml
chmod 644 /etc/YaST2//firstboot-embedded.xml
mkdir -p /etc/
mv /studio/overlay-tmp/files//etc//modprobe.conf.local /etc//modprobe.conf.local
chown root:root /etc//modprobe.conf.local
chmod 644 /etc//modprobe.conf.local
mkdir -p /etc/
mv /studio/overlay-tmp/files//etc//motd /etc//motd
chown root:root /etc//motd
chmod 644 /etc//motd
mkdir -p /etc/
mv /studio/overlay-tmp/files//etc//hosts /etc//hosts
chown root:root /etc//hosts
chmod 644 /etc//hosts
mkdir -p /etc/
mv /studio/overlay-tmp/files//etc//HOSTNAME /etc//HOSTNAME
chown root:root /etc//HOSTNAME
chmod 644 /etc//HOSTNAME
mkdir -p /etc/sysconfig/network/
mv /studio/overlay-tmp/files//etc//sysconfig/network/config /etc//sysconfig/network/config
chown root:root /etc//sysconfig/network/config
chmod 644 /etc//sysconfig/network/config
mkdir -p /etc/sysconfig/network/
mv /studio/overlay-tmp/files//etc//sysconfig/network/dhcp /etc//sysconfig/network/dhcp
chown root:root /etc//sysconfig/network/dhcp
chmod 644 /etc//sysconfig/network/dhcp
mkdir -p /etc/sysconfig/network/
mv /studio/overlay-tmp/files//etc//sysconfig/network/routes /etc//sysconfig/network/routes
chown root:root /etc//sysconfig/network/routes
chmod 644 /etc//sysconfig/network/routes
mkdir -p /etc/sysconfig/network/
mv /studio/overlay-tmp/files//etc//sysconfig/network/ifcfg-eth0 /etc//sysconfig/network/ifcfg-eth0
chown root:root /etc//sysconfig/network/ifcfg-eth0
chmod 644 /etc//sysconfig/network/ifcfg-eth0
mkdir -p /etc/init.d/
mv /studio/overlay-tmp/files//etc/init.d//setup-crowbar /etc/init.d//setup-crowbar
chown root:root /etc/init.d//setup-crowbar
chmod 755 /etc/init.d//setup-crowbar
mkdir -p /usr/bin/
mv /studio/overlay-tmp/files//usr/bin//setup-suse-crowbar /usr/bin//setup-suse-crowbar
chown root:root /usr/bin//setup-suse-crowbar
chmod 755 /usr/bin//setup-suse-crowbar
mkdir -p /srv/tftpboot/iso/
mv /studio/overlay-tmp/files//srv/tftpboot/iso//SLE-11-SP3-SMT-GM-Media1.iso /srv/tftpboot/iso//SLE-11-SP3-SMT-GM-Media1.iso
chown root:root /srv/tftpboot/iso//SLE-11-SP3-SMT-GM-Media1.iso
chmod 644 /srv/tftpboot/iso//SLE-11-SP3-SMT-GM-Media1.iso
mkdir -p /srv/tftpboot/iso/
mv /studio/overlay-tmp/files//srv/tftpboot/iso//SLE-11-SP3-SMT-GM-Media1.md5 /srv/tftpboot/iso//SLE-11-SP3-SMT-GM-Media1.md5
chown root:root /srv/tftpboot/iso//SLE-11-SP3-SMT-GM-Media1.md5
chmod 644 /srv/tftpboot/iso//SLE-11-SP3-SMT-GM-Media1.md5
mkdir -p /srv/tftpboot/iso/
mv /studio/overlay-tmp/files//srv/tftpboot/iso//SLES-11-SP3-DVD-x86_64-GM-DVD1.iso /srv/tftpboot/iso//SLES-11-SP3-DVD-x86_64-GM-DVD1.iso
chown root:root /srv/tftpboot/iso//SLES-11-SP3-DVD-x86_64-GM-DVD1.iso
chmod 644 /srv/tftpboot/iso//SLES-11-SP3-DVD-x86_64-GM-DVD1.iso
mkdir -p /srv/tftpboot/iso/
mv /studio/overlay-tmp/files//srv/tftpboot/iso//SLES-11-SP3-DVD-x86_64-GM-DVD1.md5 /srv/tftpboot/iso//SLES-11-SP3-DVD-x86_64-GM-DVD1.md5
chown root:root /srv/tftpboot/iso//SLES-11-SP3-DVD-x86_64-GM-DVD1.md5
chmod 644 /srv/tftpboot/iso//SLES-11-SP3-DVD-x86_64-GM-DVD1.md5
mkdir -p /srv/tftpboot/iso/
mv /studio/overlay-tmp/files//srv/tftpboot/iso//SUSE-CLOUD-4-x86_64-Build0008-Media1.iso /srv/tftpboot/iso//SUSE-CLOUD-4-x86_64-Build0008-Media1.iso
chown root:root /srv/tftpboot/iso//SUSE-CLOUD-4-x86_64-Build0008-Media1.iso
chmod 644 /srv/tftpboot/iso//SUSE-CLOUD-4-x86_64-Build0008-Media1.iso
mkdir -p /srv/tftpboot/iso/
mv /studio/overlay-tmp/files//srv/tftpboot/iso//SUSE-CLOUD-4-x86_64-Build0008-Media1.md5 /srv/tftpboot/iso//SUSE-CLOUD-4-x86_64-Build0008-Media1.md5
chown root:root /srv/tftpboot/iso//SUSE-CLOUD-4-x86_64-Build0008-Media1.md5
chmod 644 /srv/tftpboot/iso//SUSE-CLOUD-4-x86_64-Build0008-Media1.md5
mkdir -p /srv/tftpboot/txz/
mv /studio/overlay-tmp/files//srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part00 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part00
chown root:root /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part00
chmod 644 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part00
mkdir -p /srv/tftpboot/txz/
mv /studio/overlay-tmp/files//srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part01 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part01
chown root:root /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part01
chmod 644 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part01
mkdir -p /srv/tftpboot/txz/
mv /studio/overlay-tmp/files//srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part02 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part02
chown root:root /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part02
chmod 644 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part02
mkdir -p /srv/tftpboot/txz/
mv /studio/overlay-tmp/files//srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part03 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part03
chown root:root /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part03
chmod 644 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part03
mkdir -p /srv/tftpboot/txz/
mv /studio/overlay-tmp/files//srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part04 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part04
chown root:root /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part04
chmod 644 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part04
mkdir -p /srv/tftpboot/txz/
mv /studio/overlay-tmp/files//srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part05 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part05
chown root:root /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part05
chmod 644 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part05
mkdir -p /srv/tftpboot/txz/
mv /studio/overlay-tmp/files//srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part06 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part06
chown root:root /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part06
chmod 644 /srv/tftpboot/txz//SUSE-Cloud-3-repos-03182014.txz.part06
mkdir -p /etc/init.d/
mv /studio/overlay-tmp/files//etc/init.d//suse_studio_firstboot /etc/init.d//suse_studio_firstboot
chown root:root /etc/init.d//suse_studio_firstboot
chmod 755 /etc/init.d//suse_studio_firstboot
chown root:root /studio/build-custom
chmod 755 /studio/build-custom
# run custom build_script after build
/studio/build-custom
chown root:root /studio/suse-studio-custom
chmod 755 /studio/suse-studio-custom
test -d /studio || mkdir /studio
cp /image/.profile /studio/profile
cp /image/config.xml /studio/config.xml
rm -rf /studio/overlay-tmp
true

#======================================
# SSL Certificates Configuration
#--------------------------------------
echo '** Rehashing SSL Certificates...'
c_rehash


sh /studio/configure_xdm_theme.sh

