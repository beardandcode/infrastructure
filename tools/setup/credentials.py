#!/usr/bin/python

def main():
    print "Digital Ocean API v1"
    print "You can find these tokens here: https://cloud.digitalocean.com/api_access"
    print

    do_v1_client_id = raw_input("Client ID: ")
    do_v1_api_key = raw_input("API key: ")


    print
    print
    print "Digital Ocean API v2"
    print "You can create a personal access token here: https://cloud.digitalocean.com/settings/applications"
    print

    do_v2_token = raw_input("Token: ")

    print
    print
    print "DNSimple"
    print "You can find your API token in account: https://dnsimple.com/account"
    print

    dnsimple_email = raw_input("Email address: ")
    dnsimple_token = raw_input("Token: ")

    print
    print
    print "Mailgun"
    print "You can find your API token here: https://mailgun.com/cp"
    print

    mailgun_token = raw_input("Token: ")

    print
    print
    print "Application Configuration"
    print

    smtp_password = raw_input("SMTP password: ")

    credentials_content = """
# Digital Ocean v1

DO_V1_CLIENT_ID='{0}'
DO_V1_API_KEY='{1}'

# Digital Ocean v2

DO_V2_TOKEN='{2}'

# DNSimple

DNSIMPLE_EMAIL='{3}'
DNSIMPLE_TOKEN='{4}'

# Mailgun

MAILGUN_TOKEN='{5}'

# Application Configuration

SMTP_PASSWORD='{6}'
    """.format(do_v1_client_id, do_v1_api_key, do_v2_token, dnsimple_email, dnsimple_token, mailgun_token, smtp_password)

    with open("secure/CREDENTIALS.sh", "w") as credentials_file:
        credentials_file.write(credentials_content)


if __name__ == '__main__':
    main()
