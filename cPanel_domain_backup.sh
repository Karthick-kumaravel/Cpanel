#!/bin/bash
IFS="$"

now=$(date +"%m-%d-%Y")
mkdir -p /mnt/backup/$now
tempdir=/mnt/backup/$now
targetdir=/mnt/backup
archivefile="`date +%Y-%m-%d_%H-%M`_XYZ.tar"
cd /var/cpanel/users

find * | while read CPUSER; do
  echo "Now processing ${CPUSER} ..."
  /scripts/pkgacct ${CPUSER} $tempdir
done
# Generating single archive file
tar -cf  ${targetdir}/${archivefile} ${tempdir}
rm -rf $tempdir
