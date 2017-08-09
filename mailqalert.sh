#!/bin/bash

mail_user="To-user mailid" # Set this to your email id to receive alerts on mail queue
limit="40" # Set the limit here

logdate=`date +%d-%m-%Y-%H-%M-%S`
clear;
result="/tmp/mailqueue/eximq$logdate.txt"
queue="`/usr/sbin/exim -bpc`"
summary=$(/usr/sbin/exim -bp | /usr/sbin/exiqsumm)

if [ "$queue" -gt "$limit" ]
then
echo ""
echo "Current queue is: $queue" > $result
echo ""
echo "Summary of Mail queue" >> $result
echo "$summary" >> $_result
/usr/bin/mail -s "Number of mails on `hostname` Server : $queue" -r "Mail_Queue_Alert!!<"from-user mailid">" $mail_user < $result
fi