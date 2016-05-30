#!/bin/bash
# Description:Small script to modify ASA FW interfaces when failing between DC's in the Sandpit
# Version 0.1
# Author fil
# Date 30/05/2016
####################################################################################################
# Change to correct directory (tftpboot)
cd /opt/shadow/activate/dc1_activate
# Provide instruction and warning
echo This script will modify the interface names in the configuration backups
echo If you modify these incorrectly, it will result in DR execution script errors
echo You should only be executing this script as part of the Datacentre 2 DRP or Network Scripts DRP
echo -n "Are you sure you wish to proceed (y/n):?"
read YES_NO
if [ "$YES_NO" == "y" ]
then
# list files that will be changed
echo You will modify the following files:
ls -al FW*
fi
# Double check with operator
echo -n "Are you sure you wish to proceed (y/n):?"
read YES_NO
if [ "$YES_NO" == "y" ]
then
# Change interfaces using sed
sed -i.original s#"Ethernet1/2"#"Ethernet1/zzz"#g FWAGG0011400PR.mgmt.nbndc.local_2
fi
# list the results and files
echo The following is the result:
cat FW* | grep -e hostname -e Ethernet
ls -al FW*
#end of scipt
