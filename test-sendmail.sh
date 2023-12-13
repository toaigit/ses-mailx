#!/bin/bash

if [ $# -ne 2 ] ; then
   echo "Usage: $0 from-email to-email"
   exit 1
fi

export RECP=$2
export FROMEMAIL=$1
export MESSAGE=message.txt

mailx -r $FROMEMAIL -s "Hello From SES" $RECP < $MESSAGE
