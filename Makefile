#
#    Make variables to satisfy conventions
#
NAME = torrific-curl
VERSION = 0.0.1
PKG_NAME = $(NAME)-$(VERSION)


# Install/Uninstall make script for `torrific-curl` project
# Copyright (C) 2020 S0AndS0
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


#
#    Make variables that readers &/or maintainers may wish to modify
#
INSTALL_DIRECTORY := $(HOME)/bin
SCRIPT_NAME := torrific-curl


#
#    Make variables set upon run-time
#
## Obtain directory path that this Makefile lives in
##  Note ':=' is to avoid late binding that '=' entails
ROOT_DIRECTORY_PATH := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
ROOT_DIRECTORY_NAME := $(notdir $(patsubst %/,%,$(ROOT_DIRECTORY_PATH)))

## Detect Operating System
ifeq '$(findstring :,$(PATH))' ';'
	__OS__ := Windows
else
	__OS__ := $(shell uname 2>/dev/null || echo 'Unknown')
	__OS__ := $(patsubst CYGWIN%,Cygwin,$(__OS__))
	__OS__ := $(patsubst MSYS%,MSYS,$(__OS__))
	__OS__ := $(patsubst MINGW%,MSYS,$(__OS__))
endif


#
#    Override variables via optional configuration file
#
CONFIG := $(ROOT_DIRECTORY_PATH)/.make-config
ifneq ("$(wildcard $(CONFIG))", "")
	include $(CONFIG)
endif


#
#    Make targets and settings
#
.PHONY: clean git-pull install link-script list uninstall unlink-script
.SILENT: clean config git-pull install link-script list uninstall unlink-script
.ONESHELL: install

clean: SHELL := /bin/bash
clean: ## Removes configuration file
	[[ -f "$(CONFIG)" ]] && {
		rm -v "$(CONFIG)"
	}

config: SHELL := /bin/bash
config: ## Writes configuration file
	if [[ "$${USER}" == 'root' ]]; then
		printf 'INSTALL_DIRECTORY = /usr/local/sbin\n' > "$(CONFIG)"
	else
		printf 'INSTALL_DIRECTORY = $(INSTALL_DIRECTORY)\n' > "$(CONFIG)"
	fi
	tee -a "$(CONFIG)" 1>/dev/null <<EOF
	SCRIPT_NAME = $(SCRIPT_NAME)
	__OS__ = $(__OS__)
	EOF

install: ## Runs targets -> link-script
install: | link-script

uninstall: ## Runs targets -> unlink-script
uninstall: | unlink-script

upgrade: ## Runs targets -> uninstall git-pull install
upgrade: | uninstall git-pull install

git-pull: SHELL := /bin/bash
git-pull: ## Pulls updates from default upstream Git remote
	cd "$(ROOT_DIRECTORY_PATH)"
	git pull
	[[ -f "$(ROOT_DIRECTORY_PATH)/.gitmodules" ]] && {
		git submodule update --init --merge --recursive
	}

unlink-script: SHELL := /bin/bash
unlink-script: ## Removes symbolic links to project script
	if [[ -L "$(INSTALL_DIRECTORY)/$(SCRIPT_NAME)" ]]; then
		rm -v "$(INSTALL_DIRECTORY)/$(SCRIPT_NAME)"
	else
		printf >&2 'No link to remove at -> %s\n' "$(INSTALL_DIRECTORY)/$(SCRIPT_NAME)"
	fi

link-script: SHELL := /bin/bash
link-script: ## Symbolically links to project script
	if [[ -L "$(INSTALL_DIRECTORY)/$(SCRIPT_NAME)" ]]; then
		printf >&2 'Link already exists -> %s\n' "$(INSTALL_DIRECTORY)/$(SCRIPT_NAME)"
	else
		ln -sv "$(ROOT_DIRECTORY_PATH)/$(SCRIPT_NAME)" "$(INSTALL_DIRECTORY)/$(SCRIPT_NAME)"
	fi

list: SHELL := /bin/bash
list: ## Lists available make commands
	gawk 'BEGIN {
		delete matched_lines
	}
	{
		if ($$0 ~ "^[a-z0-9A-Z-]{1,32}: [#]{1,2}[[:print:]]*$$") {
			matched_lines[length(matched_lines)] = $$0
		}
	}
	END {
		print "## Make Commands for $(NAME) ##\n"
		for (k in matched_lines) {
			split(matched_lines[k], line_components, ":")
			gsub(" ## ", "    ", line_components[2])
			print line_components[1]
			print line_components[2]
			if ((k + 1) != length(matched_lines)) {
				print
			}
		}
	}' "$(ROOT_DIRECTORY_PATH)/Makefile"

