#! /bin/bash

TIME=0

if [ $1 ]
then
    TIME="$1"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
cd vimfiles/bundle

for D in `find . -maxdepth 1 -type d`
do
    echo updating $D
    pushd "$D"

    git pull
    sleep "$TIME"

    popd
done

exit

git submodule foreach git pull
