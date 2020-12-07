# Locals {{{1
SHELL := bash
RECIPES = bash_profile install_go vim_go

.PHONY: $(RECIPES)

GO_ARCHIVE = go1.15.6.linux-arm64.tar.gz # must exist in your pwd

# Add git branch to bash prompt {{{1
bash_profile: $(HOME)/.profile

$(HOME)/.profile: bash/.profile bash/.profile-functions
	@[ -e $(HOME)/.profile.saved ] || mv $(HOME)/.profile $(HOME)/.profile.saved
	@cp bash/.profile $(HOME)/
	@cp bash/.profile-functions $(HOME)/.profile-functions

# Install Go {{{1
install_go: /usr/local/go/bin/go $(HOME)/.profile

/usr/local/go/bin/go: $(GO_ARCHIVE)
	@sudo tar -C /usr/local -xzf $(GO_ARCHIVE)

# Use vim_go v1.24 {{{1
vim_go: $(HOME)/.vimrc $(HOME)/.vim/

$(HOME)/.vimrc: vim/.vimrc
	@[ -e $(HOME)/.vimrc.saved ] || mv $(HOME)/.vimrc $(HOME)/.vimrc.saved
	@cp vim/.vimrc $(HOME)/

$(HOME)/.vim/: vim/.vim/
	@git submodule update --init --recursive
	@cp -a vim/.vim/ $(HOME)/
