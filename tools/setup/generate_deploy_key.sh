#!/bin/bash

set -euo pipefail

source secure/CREDENTIALS.sh
DOMAIN_NAME=$(cat DOMAIN_NAME)

if [ -f secure/deploy.key ]
then
  echo "Key already exists"
else
  ssh-keygen -t rsa -f secure/deploy.key
  chmod 0600 secure/deploy.key
fi

if [ -f secure/DO_SSH_KEY.sh ]
then
  echo "Key has already been uploaded to Digital Ocean"
else
  response=$(curl -X POST "https://api.digitalocean.com/v2/account/keys" \
                  -d "{\"name\":\"${DOMAIN_NAME} deployment key\",\"public_key\":\"$(cat secure/deploy.key.pub)\"}" \
                  -H "Authorization: Bearer $DO_V2_TOKEN" \
                  -H "Content-Type: application/json")

  key_id=$(echo "${response}" | bin/jq '.ssh_key.id' -)

  echo "DO_SSH_KEY_ID=${key_id}" > secure/DO_SSH_KEY.sh
fi

