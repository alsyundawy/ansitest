#!/bin/bash

cmd="sensors -f"

(ansible rhel8 -a "$cmd"
echo '-----'
ansible rhel9 -a "$cmd"
echo '-----'
ansible debian -a "$cmd"
) 2>&1 |tee /var/log/ansible/$(basename $0)-$(date +%Y%m%d@%H%M_%S).log

date;
