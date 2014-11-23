#!/bin/bash

pushd secure/
shopt -s extglob

for file in !(*.gpg)
do
    gpg -r tombooth -e $file
done

shopt -u extglob
popd

tools/secure/clean.sh
