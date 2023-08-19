#!/bin/bash


RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
DEEPBLUE='\033[0;36m'
BLACK='\033[0;30m'
PURPLE='\033[0;35m'

function banner {
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
        echo -e "HAHA U FAILED NORMINETTE 😈😈😈 ${RED} NORM FLAG ${NC} read NORM next time!"
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

function check_file() {
    local num=$1
    local filename

    case "$num" in 
        1)
            filename="libft.a"
            ;;
        2)
            filename="libftprintf.a"
            ;;
    esac

    if [ -e "$filename" ]; then
        echo -e "${GREEN}$filename exists${NC}, thats good, now lets check if it works"
    else
        echo -e "LOL u didnt even read the mandotory part of the subject ${RED} ERROR COMPILATION FLAG  💀😈💀 ${RED}hahahahahaha${NC}"
    fi
}


check_makefile() {
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
            echo -e "Hm  nothing to see here, ${GREEN}everything is fine${NC} 😈😈😈"
        else
            echo -e "${RED}HAHAHA${NC}  YOU DO NOT HAVE ALL REQUIREMENTS IN THE MAKEFILE 😈😈😈 ${RED} NORM FLAG ${NC} read NORM next time!"
            if [ $requirement1 -ne 0 ]; then
                echo "Requirement 1: 'CC = cc'"
            fi

            if [ $requirement2 -ne 0 ]; then
                echo "Requirement 2: 'CFLAGS = -Wall -Wextra -Werror'"
                echo "This is the default flags, if u have something else, just add other flags after -W flags"
                echo -e "${RED}Example${NC}: CFLAGS = -Wall -Wextra -Werror -g -lx11 -lbsd"
                echo -e "If u evaluting with this script, u can just check if u have -Wall -Wextra -Werror flags"
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


function check_steps_amount()
{
    count=$1
    min=-10000
    max=10000

    all_numbers=($(seq $min $max))
    
    shuffled_numbers=($(echo ${all_numbers[@]} | tr ' ' '\n' | shuf))
    
    unique_numbers=(${shuffled_numbers[@]:0:$count})
    
    ./push_swap "${unique_numbers[@]}" | wc -l
}





function check_speed()
{
    read -p "ok, lets check how fast ur program is with 100 numbers (press enter to continue)"
    steps=$(check_steps_amount 100)
    echo -e "steps: $steps\n"
    if [ $steps -lt 700 ]; then
        echo -e "5 points\n"
        i=5;
    elif [ $steps -lt 900 ]; then
        echo -e "4 points\n"
        i=4;
    elif [ $steps -lt 1100 ]; then
        i=3;
        echo -e "3 points\n"
    elif [ $steps -lt 1300 ]; then
        i=2;
        echo -e "2 points\n"
    elif [ $steps -lt 1500 ]; then
        echo -e "1 point\n"
        i=1;
    else
        echo "hahah 0 points 😈😈😈, u are too slow" 
        i=0;
    fi
    read -p "ok, lets check how fast ur program is with 500 numbers (press enter to continue)"
    steps2=$(check_steps_amount 500)
    echo -e "steps: $steps2\n"
    if [ $steps2 -lt 5500 ]; then
        echo -e "5 points"
        j=5;
    elif [ $steps2 -lt 7000 ]; then
        echo -e "4 points"
        j=4;
    elif [ $steps2 -lt 8500 ]; then
        echo -e "3 points"
        j=3;
    elif [ $steps2 -lt 10000 ]; then
        echo -e "2 points"
        j=2;
    elif [ $steps2 -lt 11500 ]; then
        echo -e "1 point"
        j=1;                
    else
        j=0;
        echo "hahaha 0 points 😈😈😈, u are too slow\n"
    fi
    total=$((i + j))
    if [ $total -lt 6 ]; then
        echo -e "${RED}hahaha 😈😈😈, u are too slow\n${NC}"
    elif [ $total -lt 10 ]; then
        echo -e "${GREEN}ok, u passed all tests${NC}, but could u do it better? 😈😈😈\n${NC}"
    else
        echo -e "${GREEN}ok, u passed all tests, and u are fast 😈😈😈\n${NC}"
    fi
}

function contains() {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

function check_functions() {
    local num=$1
    echo "ok, let's check if you have forbidden function calls 😈😈😈"
    IGNORED_SYMBOLS=("__gmon_start__" "__libc_start_main")
    
    case "$num" in
        4)
            EXEC_NAME="push_swap"
            ALLOWED=("read" "write" "malloc" "free" "exit")
            ;;
        5)
            EXEC_NAME="philo"
            ALLOWED=("read" "write" "malloc" "free" "exit" "gettimeofday" "printf" "memset" "usleep" "pthread_create" "pthread_detach" "pthread_join" "pthread_mutex_init" "pthread_mutex_destroy" "pthread_mutex_lock" "pthread_mutex_unlock")
            ;;
        6)
            EXEC_NAME="minishell"
            ALLOWED=("readline" "rl_clear_history" "rl_on_new_line" "rl_replace_line" "rl_redisplay" "add_history" "printf" "malloc" "free" "write" "access" "open" "read" "close" "fork" "wait" "waitpid" "wait3" "wait4" "signal" "sigaction" "sigemptyset" "sigaddset" "kill" "exit" "getcwd" "chdir" "stat" "lstat" "fstat" "unlink" "execve" "dup" "dup2" "pipe" "opendir" "readdir" "closedir" "strerror" "perror" "isatty" "ttyname" "ttyslot" "ioctl" "getenv" "tcsetattr" "tcgetattr" "tgetent" "tgetflag" "tgetnum" "tgetstr" "tgoto" "tputs")
            ;;
        7)
            echo "write your executable name (example: a.out) its for that i can check forbidden functions"
            read EXEC_NAME
            if [ ! -f "$EXEC_NAME" ]; then
                echo "file $EXEC_NAME does not exist"
                exit 1
            fi
            echo "from the list below, choose which functions are allowed | leave empty if u dont want to check"
            echo "4 - push_swap"
            echo "5 - philo"
            echo "6 - minishell"
            read -a ALLOWED
            ;;
    esac

    if [ "$ALLOWED" -eq "$ALLOWED" ] 2>/dev/null; then
        case "$ALLOWED" in
            4)
                ALLOWED=("read" "write" "malloc" "free" "exit")
                ;;
            5)
                ALLOWED=("read" "write" "malloc" "free" "exit" "gettimeofday" "printf" "memset" "usleep" "pthread_create" "pthread_detach" "pthread_join" "pthread_mutex_init" "pthread_mutex_destroy" "pthread_mutex_lock" "pthread_mutex_unlock")
                ;;
            6)
                ALLOWED=("readline" "rl_clear_history" "rl_on_new_line" "rl_replace_line" "rl_redisplay" "add_history" "printf" "malloc" "free" "write" "access" "open" "read" "close" "fork" "wait" "waitpid" "wait3" "wait4" "signal" "sigaction" "sigemptyset" "sigaddset" "kill" "exit" "getcwd" "chdir" "stat" "lstat" "fstat" "unlink" "execve" "dup" "dup2" "pipe" "opendir" "readdir" "closedir" "strerror" "perror" "isatty" "ttyname" "ttyslot" "ioctl" "getenv" "tcsetattr" "tcgetattr" "tgetent" "tgetflag" "tgetnum" "tgetstr" "tgoto" "tputs")
                ;;
            *)
                echo "That's all what i can check, bye bye 😈😈😈"
                exit 1
                ;;
        esac
    fi
    
    RESULTS=$(nm -u $EXEC_NAME | awk '{print $2}' | sed 's/@.*$//') 

    for RES in $RESULTS; do
      if ! contains "$RES" "${ALLOWED[@]}" && ! contains "$RES" "${IGNORED_SYMBOLS[@]}"; then
        echo -e "${RED}Forbidden function call detected: $RES ${NC}"
        return 1
      fi
    done

    echo -e "${GREEN}All function calls are allowed.${NC}"
}

function main {
    banner
    local project
    echo -e "which project do you want to ${RED}fail${NC}?"
    echo "i will do it for u 😈 just type the number of the project"
    echo -e "🔥1. ${GREEN}libft${NC} 👶"
    echo -e "🔥2. ${YELLOW}ft_printf${NC} 🧑‍🎓"
    echo -e "🔥3. ${DEEPBLUE}get_next_line${NC} 🤓"
    echo -e "🔥4. push_swap 🧑"
    echo -e "🔥5. ${PURPLE}philosophers ${NC} 👴👴👴"
    echo -e "🔥6. ${RED}minishell ${NC} 💀"
    echo -e "🔥7. ${GREEN}check_other_stuff ${NC} "
    read num
    cd ..
    case $num in
        1)
            cd libft >/dev/null 2>&1 || cd 00_libft >/dev/null 2>&1 || { echo -e "${RED}I can't fail u if there is no  \"libft\" or \"00_libft\" folder into project's folder ${NC}"; exit 1; }
            git clone https://github.com/Tripouille/libftTester.git >/dev/null 2>&1; 
            cd libftTester;
            make;
            cd .. && rm -rf libftTester;
            check_makefile;
            check_file $num;
            check_norminette;
            check_authors $num ;
            check_marvin;
            make fclean;;
        2)
            project="ft_printf"
            cd ft_printf >/dev/null 2>&1 || cd 00_ft_printf >/dev/null 2>&1 || { echo -e "${RED}I can't fail u if there is no  \"printf\" or \"00_printf\" folder into project's folder ${NC}"; exit 1; }
            make re;
            check_file;
            check_norminette;
            check_authors $num ;;
        3)
            project="get_next_line"
            cd get_next_line >/dev/null 2>&1 || cd 00_get_next_line >/dev/null 2>&1 || { echo -e "${RED}I can't fail u if there is no  \"get_next_line\" or \"00_get_next_line\" folder into project's folder ${NC}"; exit 1; }
            check_norminette;
            francinette --strict;
            check_authors $num ;
            echo "there will be also more tests";;
        4)
            cd push_swap >/dev/null 2>&1 || { echo -e "${RED}I can't fail u if there is no  \"push_swap\" folder into project's folder ${NC}"; exit 1; }
            make re;
            curl https://raw.githubusercontent.com/hu8813/tester_push_swap/main/pstester.py | python3 -
            read -p "Press enter to continue or ctrl + c to exit"
            bash -c "$(curl -fsSL https://raw.githubusercontent.com/RubenPin90/push_swap_tester/master/tester.sh)" 
            check_makefile;
            check_norminette;
            check_authors $num;
            check_marvin;
            check_functions $num;
            read -p "Did u pass all tests? (y/n)" answer
            if [ "$answer" != "${answer#[Yy]}" ] ;then
                check_speed;
            else
                echo "hahah try again 😈😈😈 maybe it will help you"
            fi
            echo "making everything clean"
            rm -f testfile;
            make fclean >/dev/null 2>&1;
            echo "there will be also more tests 💀💀💀";;
        5)
            cd philo/philo >/dev/null 2>&1 || { echo -e "${RED}I can't fail u if there is no  \"philo/philo\" folder into project's folder ${NC}"; exit 1; }
            check_authors $num;
            check_norminette;
            check_marvin;
            check_functions $num;
            echo "there will be also more tests 💀💀💀";;
        6)
            cd minishell;
            make re;
            git clone https://github.com/LucasKuhn/minishell_tester.git >/dev/null 2>&1;
            cd minishell_tester;
            ./tester;
            cd ..;
            rm -rf minishell_tester;
            check_makefile;
            check_authors $num;
            check_norminette;
            check_marvin;
            check_functions $num;
            make fclean;
            echo "there will be also more tests 💀💀💀";;
        7)
            echo "set up the path to the folder with your project"
            read path
            cd $path;
            check_norminette;
            check_makefile;
            check_authors $num;
            check_marvin;
            check_functions $num;
            echo "there will be also more tests 💀💀💀";;
        *)
            echo -e "ah, u want to fail a ${YELLOW}project${NC}, but u ${RED}failed${NC} to type the right number 😈😈😈 ${RED}hahahahahaha${NC}"
            exit 1
            ;;
    esac    
}

main