#!/bin/bash

set -euo pipefail

domain_name=$(cat DOMAIN_NAME)

venv/bin/ansible-playbook -i ansible/production -e "domain_name=${domain_name}" ansible/site.yml
