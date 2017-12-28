#!/bin/bash
set -e

CONFIG_OPTIONS=/data/options.json

COUNTRY=$(jq --raw-output ".Country" $CONFIG_OPTIONS)
STATE=$(jq --raw-output ".StateOrProvince" $CONFIG_OPTIONS)
LOCALITY=$(jq --raw-output ".Locality" $CONFIG_OPTIONS)
ORG=$(jq --raw-output ".Organization" $CONFIG_OPTIONS)
ORG_UNIT=$(jq --raw-output ".OrganizationalUnit" $CONFIG_OPTIONS)
COMMON_NAME=$(jq --raw-output ".CommonName" $CONFIG_OPTIONS)
EMAIL=$(jq --raw-output ".Email" $CONFIG_OPTIONS)
CERTFILE=$(jq --raw-output ".certfile" $CONFIG_OPTIONS)
KEYFILE=$(jq --raw-output ".keyfile" $CONFIG_OPTIONS)

echo `openssl version`

openssl req \
  -sha256 \
  -newkey rsa:4096 \
  -nodes \
  -keyout /ssl/$KEYFILE \
  -x509 \
  -days 730 \
  -out /ssl/$CERTFILE \
  -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORG/OU=$ORG_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL"

