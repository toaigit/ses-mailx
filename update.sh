#!/bin/bash
#  this script generates new access.db, sendmail.cf and authinfo.db
#  See document https://docs.aws.amazon.com/ses/latest/dg/send-email-sendmail.html

makemap hash /etc/mail/authinfo.db < /tmp/ses-mailx/authinfo
makemap hash /etc/mail/access.db < /tmp/ses-mailx/access
m4 /tmp/ses-mailx/sendmail.mc > /etc/mail/sendmail.cf

systemctl stop sendmail
systemctl start sendmail
