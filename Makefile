SHELL := /bin/bash

all: dotfiles

dotfiles:
	# avoid using stow
	for file in $(shell find $(CURDIR) -maxdepth 1 -name ".*" -not -name "README.md" -not -name ".gitignore" -not -name "palette.color" -not -name ".git" -not -name ".*.swp" -not -name ".travis.yml" -not -name ".irssi" -not -name ".gnupg"); do \
	f=$$(basename $$file); \
	ln -sfn $$file $(HOME)/$$f; \
	done; \
	# -f:force, 
	# -n:no-deference treat LINK_NAME as a normal file if it is a symbolic link to a directory --> otherwise it will create link in dir
	ln -sfn $(PWD)/bin $(HOME)/bin 
	ln -sfn $(PWD)/.tmux $(HOME)/.tmux
	ln -sfn $(PWD)/tmux_workspaces $(HOME)/tmux_workspaces
