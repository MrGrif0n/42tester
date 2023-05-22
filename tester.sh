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
        Print "Norminette: Error!"
    else
        echo -e "Norminette: ${GREEN} OK!${NC}"
    fi
}

#q: how to check if there is output after find command
#a: https://stackoverflow.com/questions/1521462/looping-through-the-output-of-find

function check_marvin {
    output=$(find . -type f -exec awk 'FNR==6{print FILENAME ":" $0}' {} \; | grep "<marvin@42.fr>")
    if [ -z "$output" ]; then
        echo -e "Hm ${GREEN}no Marvin's email address ${NC} "
    else
        echo -e "Hahaha u forgot to delete marvin's email address 😈😈😈 ${RED} NORM FLAG ${NC} read NORM next time!"
        echo "$output"
    fi
}

function check_authors() {
    local num=$1  # First argument to the function
    local output=$(grep --exclude=*.sh -roP '(?<=By: )\b\S+\b|(?<=Created: )[0-9/ :]+by \b\S+\b|(?<=Updated: )[0-9/ :]+by \b\S+\b' . | awk -F' ' '{print $NF}' | awk -F':' '{print $NF}' | sort -u
)

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
            check_norminette;
            francinette --strict;
            check_authors $num ;
            check_marvin;;
        2)
            cd ft_printf;
            check_norminette;
            francinette --strict;
            check_authors $num ;;
        3)
            check_norminette;
            francinette --strict;
            check_authors $num ;
            echo "there will be also more tests";;
        4)
            cd push_swap;
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
            check_authors $num;
            check_norminette;
            check_marvin;
            echo "there will be also more tests 💀💀💀";;
        6)
            cd minishell;
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
