#!/bin/sh
find . -type d -name .git | while read dir
do
    pushd "$dir"

    git fsck --full

    git reflog expire --expire=now --all
    git gc --prune=now
    git gc --aggressive --prune=now

    git fsck --full

    popd
done
