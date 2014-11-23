#!/bin/bash

set -euo pipefail

domain_name=$(cat DOMAIN_NAME)

tools/secure/decrypt.sh

source secure/CREDENTIALS.sh
source secure/DO_SSH_KEY.sh

bin/terraform $1 -var "do_token=${DO_V2_TOKEN}" \
                 -var "do_ssh_id=${DO_SSH_KEY_ID}" \
                 -var "dnsimple_email=${DNSIMPLE_EMAIL}" \
                 -var "dnsimple_token=${DNSIMPLE_TOKEN}" \
                 -var "domain_name=${domain_name}" \
                 -state=./terraform/terraform.tfstate \
                 ./terraform

tools/secure/clean.sh
