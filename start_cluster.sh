#!/usr/bin/env bash

bx target  -c "${BX_ACCOUNT_ID2}" -o "${BX_ORG2}" -s "${BX_SPACE2}"
bx cs init

bx cs machine-types dal10 | grep -v encrypted

echo "bx cs cluster-create --name ansi-`date +%s` --location dal10 --workers 3 --kube-version `bx cs kube-versions dal10 | tail -n1` --private-vlan `bx cs vlans dal10 | grep private | cut -f 1 -d " " | head -n 1` --public-vlan `bx cs vlans dal10 | grep public | cut -f 1 -d " " | head -n 1` --machine-type "
