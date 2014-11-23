#!/bin/bash

pushd secure/
shopt -s extglob

for file in !(*.gpg)
do
    rm $file
done

shopt -u extglob
popd
