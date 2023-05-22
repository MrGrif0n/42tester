#!/bin/bash

function check_norminette {
    # Run norminette and capture its output
    output=$(norminette)

    # Check if the output contains "Error!" not followed by "OK!"
    if echo "$output" | grep -Pq 'Error!'; then
        # If there was an error, print the error block
        echo "$output" | awk -v RS= '/Error!/' | sed -n '/Error!/,/: OK!/p' | grep -v ': OK!'
        Print "Norminette: Error!"
    else
        # If there was no error, print "Norminette: OK!"
        echo "Norminette: OK!"
    fi
}

function check_autors
{
    grep  --exclude=*.sh -roP '(?<=By: )[^<"]+' . | sed 's/.*://; /^$/d' | sort -u
}


function main {
    check_norminette 
    check_autors
}

main
