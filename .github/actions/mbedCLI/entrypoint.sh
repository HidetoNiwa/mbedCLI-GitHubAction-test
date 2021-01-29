#!/bin/bash
set -eux

apt update

apt upgrade -y

apt install gcc-arm-none-eabi -y

pip3 install mbed-cli

pip3 install pyyaml jsonschema mbed_cloud_sdk jinja2 mbed_ls mbed_host_tests mbed_greentea pyelftools manifest_tool icetea pycryptodome pyusb cmsis_pack_manager psutil cryptography click cbor

mbed compile -t GCC_ARM -m NUCLEO_F446RE

today=`date "+%Y%m%d%H%M%S"`
# create release
res=`curl -H "Authorization: token $GITHUB_TOKEN" -X POST https://api.github.com/repos/$GITHUB_REPOSITORY/releases \
-d "
{
  \"tag_name\": \"$today\",
  \"target_commitish\": \"$GITHUB_SHA\",
  \"name\": \"$today\",
  \"draft\": false,
  \"prerelease\": false
}"`

# extract release id
rel_id=`echo ${res} | python3 -c 'import json,sys;print(json.load(sys.stdin)["id"])'`

# upload built pdf
curl -H "Authorization: token $GITHUB_TOKEN" -X POST https://uploads.github.com/repos/$GITHUB_REPOSITORY/releases/${rel_id}/assets?name=main.pdf\
--header 'Content-Type: application/pdf'\
--upload-file main.pdf