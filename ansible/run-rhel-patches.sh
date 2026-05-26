#!/bin/bash

echo "Make sure /etc/ansible/hosts is up to date"
if [ "$1" = "" ]; then
  ansible-playbook -vv updt-rhel.yaml 2>&1 |tee /var/log/ansible/$(basename $0)-$(date +%Y%m%d@%H%M_%S).log
else
  ansible-playbook -vv updt-rhel.yaml --limit "$@" 2>&1 |tee /var/log/ansible/$(basename $0)-limited-$(date +%Y%m%d@%H%M_%S).log
fi

date

# HOWTO Rerun a failed job:
# ansible-playbook updt-debian.yaml --limit rhel9-xrdp.ho
#                                               ^ single server
