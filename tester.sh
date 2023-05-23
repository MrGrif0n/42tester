#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
DEEPBLUE='\033[0;36m'
BLACK='\033[0;30m'
PURPLE='\033[0;35m'

function banner
{
    clear;
    echo "                                    🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥";
    echo "                                    🔥                                                                                                  🔥";
    echo "                                    🔥   ██████  █████  █ █████    █████     ██    █ █ █████  ██████ █████ █████ ██████ █████ █████     🔥";
    echo "                                    🔥   █       █   ██ █ █      ██  |  ██   ███   █   █        ██   █     █       ██   █     █   ██    🔥";
    echo -e "                                    🔥   █  😈   █████  █ ████  █----${RED}o${NC}----█  █ ██  █   █████    ██   ████  █████   ██   ████  █████     🔥";
    echo "                                    🔥   █    █  █   ██ █ █      ██  |  ██   █  ██ █       █    ██   █         █   ██   █     █   ██    🔥";
    echo "                                    🔥   ██████  █   ██ █ █        █████     █   ███   █████    ██   █████ █████   ██   █████ █   ██    🔥";
    echo -e "                                    🔥${RED}or how to fail a project in 5 minutes😈😈😈${NC}                                                       🔥";
    echo "                                    🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥";
}

function check_norminette { 
    output=$(norminette)
    if echo "$output" | grep -Pq 'Error!'; then
        echo "$output" | awk -v RS= '/Error!/' | sed -n '/Error!/,/: OK!/p' | grep -v ': OK!'
        echo "HAHA U FAILED NORMINETTE 😈😈😈 ${RED} NORM FLAG ${NC} read NORM next time!"
    else
        echo -e "Norminette: ${GREEN} OK!${NC}"
    fi
}

function check_marvin {
    output=$(find . -type f -exec awk 'FNR==6{print FILENAME ":" $0}' {} \; | grep "<marvin@42.fr>")
    if [ -z "$output" ]; then
        echo -e "Hm ${GREEN}no Marvin's email address ${NC}"
    else
        echo -e "Hahaha u forgot to delete marvin's email address 😈😈😈 ${RED} NORM FLAG ${NC} read NORM next time!"
        echo "$output"
    fi
}

function check_authors() {
    local num=$1  # First argument to the function
    local output=$(grep --exclude=*.sh -roP '(?<=By: )\b\S+\b|(?<=Created: )[0-9/ :]+by \b\S+\b|(?<=Updated: )[0-9/ :]+by \b\S+\b' . | awk -F' ' '{print $NF}' | awk -F':' '{print $NF}' | sort -u)

    echo "AUTORS:"
    echo "$output"
    
    local line_count=$(echo "$output" | wc -l)

    if [ "$num" -eq 6 ]; then
        if [ "$line_count" -gt 2 ]; then
            echo -e "HAHAHAHA U COPIED CODE FROM SOMEONE ELSE 😈😈😈 ${RED}-42 FLAG ${NC}"
        else
            echo -e "Hm right number of authors, but u think u can ${RED}fool${NC} me? ${RED}hahahahahaha${NC}, lets check the ${RED}email addresses${NC}"
        fi
    else
        if [ "$line_count" -gt 1 ]; then
            echo -e "HAHAHAHA U COPIED CODE FROM SOMEONE ELSE 😈😈😈 ${RED}-42 FLAG ${NC}"
        else
            echo -e "Hm right number of authors, but u think u can ${RED}fool${NC} me? ${RED}hahahahahaha${NC}, lets check the ${RED}email addresses${NC}"
        fi
    fi
}

function check_file()
{
    if [ -e libftprintf.a ] || [ -e libft.a ]; then
        echo "file exists, thats good, now lets check if it works 😈😈😈"
    else
        echo -e "LOL u didnt even read the mandotory part of the subject ${RED} ERROR COMPILATION FLAG  💀😈💀 ${RED}hahahahahaha${NC}"
    fi
}

check_makefile()
{
    if [ -e Makefile ]; then
        echo -e "${GREEN}Makefile exists${NC}, thats good, now lets check if u have all right"
        Makefile=$(cat Makefile)

        requirement1=$(echo "$Makefile" | grep -Pq 'CC = cc'; echo $?)
        requirement2=$(echo "$Makefile" | grep -Pq 'CFLAGS = -Wall -Wextra -Werror'; echo $?)
        requirement3=$(echo "$Makefile" | grep -Pq 'NAME = '; echo $?)
        requirement4=$(echo "$Makefile" | grep -Pq 'all: '; echo $?)
        requirement5=$(echo "$Makefile" | grep -Pq 'clean: '; echo $?)
        requirement6=$(echo "$Makefile" | grep -Pq 'fclean: '; echo $?)
        requirement7=$(echo "$Makefile" | grep -Pq 're:'; echo $?)

        if [ $requirement1 -eq 0 ] && [ $requirement2 -eq 0 ] && [ $requirement3 -eq 0 ] && \
           [ $requirement4 -eq 0 ] && [ $requirement5 -eq 0 ] && [ $requirement3 -eq 0 ]; then
            echo "Hm  nothing to see here, everything is fine 😈😈😈"
        else
            echo -e "${RED}HAHAHA${NC}  YOU DO NOT HAVE ALL REQUIREMENTS IN THE MAKEFILE 😈😈😈 ${RED} NORM FLAG ${NC} read MAKEFILE next time!"
            if [ $requirement1 -ne 0 ]; then
                echo "Requirement 1: 'CC = cc'"
            fi

            if [ $requirement2 -ne 0 ]; then
                echo "Requirement 2: 'CFLAGS = -Wall -Wextra -Werror'"
                echo "This is the default flags, if u have something else, just add it to the end of the line"
                echo -e "${RED}Example${NC}: CFLAGS = -Wall -Wextra -Werror -g -lx11 -lbsd"
                echo -e "If u evaluting with this script, u can just ignore this message"
            fi

            if [ $requirement3 -ne 0 ]; then
                echo "Requirement 3: 'NAME = '"
            fi
            if [ $requirement4 -ne 0 ]; then
                echo "Requirement 4: 'all:'"
            fi

            if [ $requirement5 -ne 0 ]; then
                echo "Requirement 5: 'clean:'"
            fi

            if [ $requirement6 -ne 0 ]; then
                echo "Requirement 6: 'fclean:'"
            fi

            if [ $requirement7 -ne 0 ]; then
                echo "Requirement 7: 're:'"
            fi
            read -p "Press enter to continue or ctrl + c to exit"
        fi
    else
        echo -e "LOL u didnt even read the mandotory part of the subject ${RED} ERROR COMPILATION FLAG  💀😈💀 ${RED}hahahahahaha${NC}"
    fi
}

function main {
    banner
    echo -e "which project do you want to ${RED}fail${NC}?"
    echo "i will do it for u 😈 just type the number of the project"
    echo -e "🔥1. ${GREEN}libft${NC} 👶"
    echo -e "🔥2. ${YELLOW}ft_printf${NC} 🧑‍🎓"
    echo -e "🔥3. ${DEEPBLUE}get_next_line${NC} 🤓"
    echo -e "🔥4. push_swap 🧑"
    echo -e "🔥5. ${PURPLE}philosophers ${NC} 👴👴👴"
    echo -e "🔥6. ${RED}minishell ${NC} 💀"
    read num
    case $num in
        1)
            cd libft;
            check_makefile;
            make re;
            check_file;
            check_norminette;
            check_authors $num ;
            check_marvin;;
        2)
            cd ft_printf;
            check_makefile;
            make re;
            check_file;
            check_norminette;
            check_authors $num ;;
        3)
            check_norminette;
            francinette --strict;
            check_authors $num ;
            echo "there will be also more tests";;
        4)
            cd push_swap;
            check_makefile;
            make re;
            curl https://raw.githubusercontent.com/hu8813/tester_push_swap/main/pstester.py | python3 -
            read -p "Press enter to continue or ctrl + c to exit"
            bash -c "$(curl -fsSL https://raw.githubusercontent.com/RubenPin90/push_swap_tester/master/tester.sh)" 
            make fclean;
            check_authors $num;
            check_norminette;
            check_marvin;
            echo "there will be also more tests 💀💀💀";;
        5)
            cd philo;
            check_makefile;
            make re;
            check_authors $num;
            check_norminette;
            check_marvin;
            echo "there will be also more tests 💀💀💀";;
        6)
            cd minishell;
            check_makefile;
            make re;
            git clone https://github.com/LucasKuhn/minishell_tester.git
            cd minishell_tester;
            ./tester;
            cd ..;
            rm -rf minishell_tester;
            make fclean;
            check_authors $num;
            check_norminette;
            check_marvin;
            echo "there will be also more tests 💀💀💀";;
        *)
            echo -e "ah, u want to fail a ${YELLOW}project${NC}, but u ${RED}failed${NC} to type the right number 😈😈😈 ${RED}hahahahahaha${NC}"
            exit 1
            ;;
    esac    
}

main
