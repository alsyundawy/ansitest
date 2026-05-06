#!/bin/bash

echo "Make sure /etc/ansible/hosts is up to date"
ansible-playbook -vv freshinstall-rhel.yml --extra-vars "target=rocky9-freshinstall"  2>&1 \
 |tee /var/log/ansible/$(basename $0)-$(date +%Y%m%d@%H%M_%S).log

date

# HOWTO Rerun a failed job:
# ansible-playbook updt-debian.yaml --limit rhel9-xrdp.ho
#                                               ^ single server
