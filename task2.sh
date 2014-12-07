#!/bin/bash
echo -e "HTTP/1.1 200 OK\n\nHello World">req.txt
while true
do
    rm file.txt
    cat req.txt | netcat -l -p 1501 >> file.txt
    read line <file.txt
    if [[ $line == *"/hello"* ]]
    then
        echo -e "HTTP/1.1 200 OK\n\nHello World">req.txt
    elif [[ $line == *"/echo"* ]]
    then
        echo -e "HTTP/1.1 200 OK\n\n" >req.txt
        cat file.txt >>req.txt
    fi
done
