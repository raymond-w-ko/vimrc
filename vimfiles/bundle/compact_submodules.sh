#!/bin/bash

for D in `find . -maxdepth 1 -type d`
do
    pushd "$D"

    git fsck --full

    git reflog expire --expire=now --all
    git gc --prune=now
    git gc --aggressive --prune=now

    git fsck --full

    popd
done
