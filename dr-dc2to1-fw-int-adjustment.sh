#!/bin/bash
# Small script to modify ASA FW interfaces when failing between DC's in the Sandpit
cd /opt/shadow/activate/dc1_activate
echo This script will modify the interface names in the configuration backups
echo If you modify these incorrectly, it will result in DR execution script errors
echo -n "Are you sure you wish to proceed (y/n):?"
read YES_NO
if [ "$YES_NO" == "y" ]
then
echo You will modify the following files:
ls -al FWAGG*
fi
echo -n "Are you sure you wish to proceed (y/n):?"
read YES_NO
if [ "$YES_NO" == "y" ]
then
sed -i.original s#"Ethernet1/2"#"Ethernet1/zzz"#g FWAGG0011400PR.mgmt.nbndc.local_2
fi
echo The following is the result:
cat FWAGG*.local.mgmt.nbnco | grep Ethernet1/
#end of scipt
