#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
cd vimfiles/bundle

for D in `ls | grep -v set_upstreams.sh`
do
    echo
    echo updating $D

    cd $D
    git pull
    sleep 15
    cd ..
done

exit

git submodule foreach git pull
