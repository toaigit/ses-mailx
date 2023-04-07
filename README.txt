OS Package Installation:
  dnf install -y dnf-utils zip unzip git bind-utils mailx sendmail
UPDATE the sendmail.mc for the following lines:
   SMART_HOST (i.e., email-smtp.us-west-2.amazonaws.com)
   MASQUERADE_AS (i.e., resourceonline.org)
UPDATE the authinfo file with your aws ses account info:
   AWS-SES-USER (i.e., AKIA3KTDBR5XIGGBMDKM)
   AWS-SES-PWD  (i.e., BHAhBnt/1wXb9xaddTnff3OOFaVR/qDmKO73dNz/nXtb)
UPDATE the access file with your aws ses account info:
   Connect:YOUR-AWS-SMTP-ENDPOINT   RELAY
   i.e., Connect:email-smtp.us-west-2.amazonaws.com RELAY

NOTEs:  Please familiar with the following documents
https://docs.aws.amazon.com/ses/latest/dg/send-email.html
https://docs.aws.amazon.com/ses/latest/dg/send-email-sendmail.html

WHAT IS SMTP Server, SMTP Relay Servers?
https://whatismyipaddress.com/mail-server
https://www.socketlabs.com/blog/smtp-relay/
https://www.proofpoint.com/us/threat-reference/smtp-relay
