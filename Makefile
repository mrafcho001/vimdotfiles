.PHONY : sync_files initial

default: sync_files

#Copy all VIM files
sync_files:
	rsync -avh --exclude='Makefile' --exclude='.git' --exclude='README.md' ./ ~/.

#Get neobundle and copy all the files, start vim to install the rest of the plugins
initial: sync_files
	mkdir -p ~/.vim/bundle
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
