#!/bin/bash

echo "Installing dependencies"

./tools/setup/install_dependencies.sh

echo "Gathering credentials"

./tools/setup/credentials.py

echo "Generating deploy key"

./tools/setup/generate_deploy_key.sh

echo "Encrypting"

./tools/secure/encrypt.sh
