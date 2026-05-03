#!/bin/bash

# NOTE currently does not work right - takeover script is installing updates as ansible is getting a pipeline break

ansible-playbook -vv updt-win.yaml 2>&1 |tee /var/log/ansible/$(basename $0)-$(date +%Y%m%d@%H%M_%S).log

date

# HOWTO Rerun a failed job:
# ansible-playbook updt-debian.yaml --limit zfs-samba.lan
#						^ single server
