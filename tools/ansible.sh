#!/bin/bash

set -euo pipefail

domain_name=$(cat DOMAIN_NAME)

venv/bin/ansible-playbook --ask-vault-pass -i ansible/production -e "@ansible/secrets.yml" -e "domain_name=${domain_name}" ansible/site.yml
