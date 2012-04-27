#! /bin/bash

TIME=0

if [ $1 ]
then
    TIME="$1"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
cd vimfiles/bundle

for D in `ls | grep -v set_upstreams.sh`
do
    echo
    echo updating $D

    cd $D
    git pull
    sleep "$TIME"
    cd ..
done

exit

git submodule foreach git pull
