#!/bin/bash

cd $HOME

git clone git@github.com:MrGrif0n/tester.git Grifon_tester

chmod +x $HOME/Grifon_tester/tester.sh

if [[ "$SHELL" == *"bash"* ]]; then  #  works no matter path is /usr/bin/bash or /bin/bash
    RC_FILE="$HOME/.bashrc"
elif [[ "$SHELL" == *"zsh"* ]]; then
    RC_FILE="$HOME/.zshrc"
fi

if ! grep "gtest=" $RC_FILE &> /dev/null; then
	echo "gtest alias not present"
	echo "Adding alias in file: $RC_FILE"
	echo -e "\nalias gtest=\"$HOME/Grifon_tester/tester.sh\"\n" >> $RC_FILE
fi

exec $SHELL
