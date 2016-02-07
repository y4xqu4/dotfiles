#!/bin/zsh
SCRIPTS=$(echo bin/**/*(.) | tr " " "\n")

echo 'This will install the following scripts to ~/bin:'
echo "$SCRIPTS"
echo ''
echo 'Do you want to install them now? [y/N]'

read I
if [[ $I != "y" ]]; then
    echo "Nothing changed."
    exit;
fi;

while read f; do
    if [ -e "$HOME/$f" ]; then
        echo "$HOME/$f does already exist. Skipping."
    else
        mkdir -p "$(dirname $HOME/$f)"
        echo "ln -s $PWD/$f $HOME/$f"
        ln -s "$PWD/$f" "$HOME/$f"
    fi
done < <(echo $SCRIPTS)

echo "all done."