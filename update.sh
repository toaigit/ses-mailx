#!/bin/bash
#  this script generates new access.db, sendmail.cf and authinfo.db
#  See document https://docs.aws.amazon.com/ses/latest/dg/send-email-sendmail.html


makemap hash /etc/mail/authinfo.db < /etc/mail/authinfo
makemap hash /etc/mail/access.db < /etc/mail/access
m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf
chmod 640 /etc/mail/authinfo

systemctl stop sendmail
systemctl start sendmail
