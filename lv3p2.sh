#!/usr/bin/bash
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

if [ ! $1 == "" ]
then
    echo "File for the created application: $1"
    echo "Three files will be created: "
    for EXT in " " ".conf" ".lib"
        do
            echo "$1$EXT"
    done

    if [ ! -e "/opt/$1" -a ! -e "/usr/lib/$1.lib" -a ! -e "/etc/kramarev/$1.conf" ] 
        then
            echo "Files are free to be created"
            
            touch "/opt/$1"
            chmod a+x "/opt/$1"

            touch "/usr/lib/$1.lib"

            mkdir -p "/etc/kramarev" && touch "/etc/kramarev/$1.conf"
            echo "/usr/lib/$1.lib" >> "/etc/kramarev/$1.conf"
            echo "/opt/$1" >> "/etc/kramarev/$1.conf"

            echo "Application installed"
        else
            echo "You foola"
    fi
    # echo -e "/usr/lib/$1.lib"
    # echo -e "/etc/kramarev/$1.conf"

    # if [ ! -e "/opt/$1" -a ! -e "/usr/lib/$1.lib" -a ! -e "/etc/kramarev/$1.conf" ]
    # then
    #     sudo su
    #     echo "Files are free to be created"
        
    #     touch "/opt/$1"
    #     chmod a+x "/opt/$1"

    #     touch "/usr/lib/$1.lib"

    #     mkdir -p "/etc/kramarev" && touch "/etc/kramarev/$1.conf"
    #     echo "/usr/lib/$1.lib" >> "/etc/kramarev/$1.conf"
    #     echo "/opt/$1" >> "/etc/kramarev/$1.conf"

    #     echo "Application installed"
    # else
    #     echo "Error: one or more files already exist"
    # fi
else
    echo "No filename specified"
fi