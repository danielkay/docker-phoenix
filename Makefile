P := "$$(tput setaf 2)"
S := "$$(tput setaf 4)"
L := "$$(tput setaf 6)"
G := "$$(tput setaf 10)"
R := "$$(tput sgr0)"
usage:
	@echo ""
	@echo " $(L)┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$(R)"
	@echo " $(L)┃ $(R)Dockerized Phoenix Development Stack$(L) ┃$(R)"
	@echo " $(L)┡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩$(R)"
	@echo " $(L)│ $(R)Available Commands:$(L)                  │$(R)"
	@echo " $(L)╰─┬────────────────────────────────────╯$(R)"
	@echo "   $(L)╰─$(R) $(P)up$(R) - launch phoenix development stack"
	@echo ""

MKFILE := $(abspath $(lastword $(MAKEFILE_LIST)))
MKDIR  := $(dir $(MKFILE))

GIT_BRANCH = $(shell git rev-parse --abbrev-ref HEAD)

# Shortcuts
up:
	@echo "$(P)Launching Phoenix Development Containers...$(R)";\
	COMPOSE_IGNORE_ORPHANS=True docker-compose --log-level ERROR -p docker-phoenix up -d;\
	echo "$(G)Done!$(R)\n\r"
