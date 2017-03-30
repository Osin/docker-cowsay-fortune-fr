#!/usr/bin/env bash
if [ "$1" == "list" ];  then
    if [ "$2" == "fortunes" ];  then
        ls /usr/share/games/fortunes | grep -v '\.dat$' | grep -v '\.u8$';
    elif [ "$2" == "formats" ]; then
        ls -1 /usr/share/cowsay/cows | sed -e 's/\..*$//'
    else
        echo "list [fortunes|formats]"
    fi
else
/usr/games/fortune $1 | iconv -c --silent -f ISO_8859-1 -t UTF-8}  | /usr/games/cowsay -f $2
fi