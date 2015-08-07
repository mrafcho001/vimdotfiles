
default: all

#Copy all files, except this Makefile
all:
	rsync -avh --exclude='Makefile' --exclude='.git' --exclude='README.md' ./ ~/.
