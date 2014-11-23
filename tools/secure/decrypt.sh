#!/bin/bash

pushd secure/

for gpg_file in *.gpg
do
    file=$(echo $gpg_file | rev | cut -c 5- | rev)
    gpg -d $gpg_file > $file
done

chmod 0600 *.key

popd
