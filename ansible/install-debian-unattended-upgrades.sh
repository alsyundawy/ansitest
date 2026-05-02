#!/bin/bash

apt update
apt install -y unattended-upgrades

[ -e /etc/apt/apt.conf.d/50unattended-upgrades ] && \
echo 'Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";
' >> /etc/apt/apt.conf.d/50unattended-upgrades 		# autodel old kernels

ls -lh /etc/apt/apt.conf.d/50unattended-upgrades
dpkg -l |grep -c unattend
