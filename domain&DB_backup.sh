#!/bin/bash
#Purpose = Backup of Important Data

TIME=`date +%b-%d-%y` # This Command will add date in Backup File Name.
FILENAME=backup-$TIME.tar.gz # Here i define Backup file name format.

SRCDIR1=/home/domain1/
SRCDIR2=/home/domain2/
SRCDIR3=/var/lib/mysql

DESDIR=/mnt/backup # Destination of backup file.

tar -cpzf $DESDIR/$FILENAME $SRCDIR1 $SRCDIR2 $SRCDIR3

