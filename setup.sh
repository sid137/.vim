#!/bin/bash +x
# This script downloads vim from the mercurial source repo, and installs it into
# the ~/vim folder.  It then downloads my vim configuration from github, and
# places them into the ~/.vim folder.
#
# Finally, it compiles vim from source, and installs the compiled version into
# your local vim folder.  You then need to add the compiled binary to your path, 

cd ~/
git clone --recursive git://github.com/sid137/.vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
hg clone https://vim.googlecode.com/hg/ vim
cd vim
./configure --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-perlinterp --enable-cscope --enable-multibyte  --with-features=huge --enable-fontset --enable-xim --with-x --prefix=$HOME/vim

make; make install

cat <<-END
Add the following line to your .zshrc or .bashrc config file

    export PATH=\$PATH:\$HOME/vim/bin
END

