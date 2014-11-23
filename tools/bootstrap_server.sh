#!/bin/bash

set -euo pipefail

group=$1
ip_address=$2
domain_name=$(cat DOMAIN_NAME)

inventory="/tmp/${domain_name}-${group}-${ip_address}"

echo "[${group}]" > $inventory
echo "${ip_address}" >> $inventory

ssh_status=1
while [ $ssh_status -ne 0 ]
do
  echo "Testing SSH connection"
  set +e
  ssh -i secure/deploy.key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q root@$ip_address exit
  ssh_status=$?
  set -e
  sleep 1
done

echo "SSH connection available, running ansible"

ANSIBLE_HOST_KEY_CHECKING=False venv/bin/ansible-playbook -vvvv -u root --private-key=secure/deploy.key -i "${inventory}" -l "${ip_address}" -e "domain_name=${domain_name}" ansible/site.yml
