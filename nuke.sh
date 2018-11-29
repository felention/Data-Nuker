#!/bin/bash
ld=$(pwd)
if [[ -z $1 ]]; then
    echo 'No directory entered'
    exit 0
fi
cd $1
ld2=$(pwd)
echo "Nuking files in $ld2"
if [[ -z $2 ]]; then
    echo 'To confirm, type "Continue"'
    read con
fi
n=1
if [[ $con == "Continue" ]] || [[ $2 == "f" ]]; then
    find . -name "*" -exec mv -t ./ {} \; 2>/dev/null
    for i in {1..10}
    do
        for d in */
        do
            mv "${d}" "$(bash ~/Documents/ranchar.sh)"
        done
        for f in $(find . -type f)
        do
            mv "$f" "$(bash ~/Documents/ranchar.sh)"
        done
        touch "emptyfile-$((n++))"
        find . -type f -exec mv {} "$(bash ~/Documents/ranchar.sh)" \;
    done
    shred -zn 50 * 2>/dev/null
fi
echo "Done"
cd $ld
exit 0
