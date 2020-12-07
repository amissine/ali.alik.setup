# Locals {{{1
SHELL := bash
RECIPES = bash_profile install_go

.PHONY: $(RECIPES)

GO_ARCHIVE = go1.15.6.linux-arm64.tar.gz # must exist in your pwd

bash_profile: $(HOME)/.profile

$(HOME)/.profile: bash/.profile bash/.profile-functions
	@[ -e $(HOME)/.profile.saved ] || mv $(HOME)/.profile $(HOME)/.profile.saved
	@cp bash/.profile $(HOME)/.profile
	@cp bash/.profile-functions $(HOME)/.profile-functions

install_go: /usr/local/go/bin/go $(HOME)/.profile

/usr/local/go/bin/go: $(GO_ARCHIVE)
	@sudo tar -C /usr/local -xzf $(GO_ARCHIVE)
