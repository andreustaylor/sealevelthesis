#!/bin/bash
set -eu

fileSrc=../c
for fileSrc in $(ls ../chapters/*tex); do
    echo "===================================="
    echo $fileSrc
    fileTgt=$(basename $fileSrc).tmp
    # find all the cite commands
    # ...list the keys
    egrep  -o "cite.*[{].*[}]" $fileSrc | cut -d} -f1 | cut -d{ -f2 | sort -u > $fileTgt
    # look for keys in the bib file
    for keyStr in $(cat $fileTgt); do
        echo '----'
        echo $keyStr
        for key in $(echo $keyStr | tr -s , ' ' ); do
            echo $key
            grep "$key" references.bib
        done
    done
done
