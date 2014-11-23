#!/bin/bash

set -euo pipefail

os=`uname | tr '[:upper:]' '[:lower:]'`

mkdir -p bin

download_hashi() {
  name=$1
  version=$2

  curl -L "https://dl.bintray.com/mitchellh/${name}/${name}_${version}_${os}_amd64.zip" > bin/${name}.zip
  unzip bin/${name}.zip -d bin/
  rm bin/${name}.zip
}

download_hashi "terraform" "0.3.1"

if [[ "$os" == "darwin" ]]
then
  jq_os="osx"
else
  jq_os="$os"
fi

curl -L "http://stedolan.github.io/jq/download/${jq_os}64/jq" > bin/jq
chmod +x bin/jq

if [[ ! -d venv ]]
then
  virtualenv venv
fi

# activate and deactivate seem to use unbound vars
set +o nounset
source venv/bin/activate
pip install -r requirements.txt
deactivate
