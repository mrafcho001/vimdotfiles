.PHONY : sync_files initial

neovim: neovim_sync_files neovim_initial

vim: sync_files initial

#Copy all VIM files
sync_files:
	# Copy VIM files
	rsync -avh ./vim/ ~/.

neovim_sync_files:
	# Copy NeoVIM files
	rsync -avh ./neovim/ ~/.config/nvim/

#Get vim-plugged and copy all the files, start (neo)vim to install the rest of the plugins
initial: sync_files
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

neovim_initial:
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
