#!/bin/bash
set +x

echo "Installing homebrew."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing items we need."
/usr/local/bin/brew install git wget weechat

echo "Installing bash_profile."
cp bash/bash_profile ~/.bash_profile
echo "Installing inputrc..."
cp bash/inputrc ~/.inputrc

echo "Install git configuration."
cp git/gitconfig ~/.gitconfig
cp git/gitignore_global ~/.gitignore_global

echo "Cloning powerline fonts, and shell"
git clone https://github.com/powerline/fonts.git ~/git/powerline/fonts
echo "Executing install for powerline fonts."
~/git/powerline/fonts/install.sh
echo "Install complete. Cleaning up."
rm -rf ~/git/powerline/fonts

echo "Cloning powerline-shell"
git clone https://github.com/banga/powerline-shell.git ~/git/powerline/shell
cp ~/git/powerline/shell/config.py.dist ~/git/powerline/shell/config.py
#vim ~/git/powerline/shell/config.py
sed -i -e "s/#    \'exit_code/    'exit_code/g" ~/git/powerline/shell/config.py
cd ~/git/powerline/shell
python install.py
ln -s ~/git/powerline/shell/powerline-shell.py ~/bin/powerline-shell.py

