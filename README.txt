Overview:
For the integration the sendmail with AWS SES, you would need to have the following:

  AWS SES credential, endpoint, port number.  This information is available after you
  create the AWS SES. You may need to log a request to AWS to increase your daily quota.

  You also need to add your team emails to the SES validation.  Only team members who
  has validated their email can send email using AWS SES.  This can be done by click
  on the verified identities link (see ses-creation image).

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
RUN update.sh to update sendmail configuration file

VALIDATE 
  Once the setup done (after running the update.sh), you can validate sendmail using the script test-sendmail.sh script

NOTEs:  Please familiar with the following documents
https://docs.aws.amazon.com/ses/latest/dg/send-email.html
https://docs.aws.amazon.com/ses/latest/dg/send-email-sendmail.html

Create SMTP credential using AWS console
    IAM User Name:  ses-smtp-vpsa-dev (then click create Button)
    You then download the credentials (userid password), or click on the
    Show User SMTP security credential 
Verify sender email
    Click on Verified identities (making sure you are on the correct region.
    Click on Create identity button, then select Email Address, then enter 
    the email address.  AWS will send the email to this user and this user will
    need to click on the link to validate the email.
    NOTE that - You will see SMTP endpoint, port information on the SMTP settings link.

OPTIONAL:  
   if you want to use terraform you can use the two terraform templates
      create-smtp-user.templ and verify-email.templ
   You need to have the following permissiont to run the terraform:
     	"ses:VerifyEmailIdentity",
	"ses:DeleteIdentity",  
	"iam:CreateUser",
	"iam:TagUser",
	"iam:PutUserPolicy",
	"iam:CreateAccessKey",
	"iam:DeleteUserPolicy",
	"iam:DeleteAccessKey",
	"iam:DeleteUser",
NOTE:
   SMTP endpoint TLS port 465 or 2465, STARTTLS 587 or 2587
   if you get "AUTH=client, available mechanisms do not fulfill requirements" error, you need to install cyrus-sasl-plain package.
   if you get "Connection refused by 0.0.0.0", you need to set the hostname matching your MASQUERADE_AS setting in sendmail.mc file with hostnamectl set-hostname fqdn-hostname
   if you can send only to verified-emails, you need to place a request to have your aws ses to a production mode (out of the sandbox status).
   You also need to allow outbound to port 587 (STARTTLS 587).

FOR MORE INFORMATION ON WHAT IS SMTP Server, SMTP Relay Servers?
https://whatismyipaddress.com/mail-server
https://www.socketlabs.com/blog/smtp-relay/
https://www.proofpoint.com/us/threat-reference/smtp-relay
