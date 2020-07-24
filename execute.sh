#!/bin/bash

domain_name=$1
region=$2

# default region to Frankfurt if not specified
if [ -z "$region" ]; then
    region = "eu-central-1"
fi

#step 1: Make sure Route 53 hosted zone for domain exists
echo "Checking Route 53 for '${domain_name}' hosted_zone"
hosted_zone_id="$(aws route53 list-hosted-zones --query "HostedZones[?Name == '${domain_name}.'].Id | [0]")"

if [ -z "$hosted_zone_id" ]; then
    echo "Zone not found. Creating ..."
    create_zone_result = "$(aws route53 create-hosted-zone --name another.domain --caller-reference `date +%s.%N`)"
    hosted_zone_DNS_servers = "$(echo "${create_zone_result}" | jq -r DelegationSet )"
    hosted_zone_id = "$(echo "${create_zone_result}" | jq -r HostedZone.Id )"
    
    echo "Please update your domain registrar with following nameservers: ${hosted_zone_DNS_servers}"
fi

echo "AWS hosted zone id: ${hosted_zone_id}"

#step 2: build files for deployment
npm run build

#step 3: create infrastructure
terraform init
terraform get -update
terraform apply \
    -auto-approve \
    -var "domain_name=${domain_name}" \
    -var "region=${region}"
