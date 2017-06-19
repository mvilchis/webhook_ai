########################################
##            Variables               ##
########################################

PROJECT_NAME:=$(shell cat .project-name)

SHELL := /bin/bash



########################################
##            Ayuda                   ##
########################################

## COLORS
BOLD   := $(shell tput -Txterm bold)
GREEN  := $(shell tput -Txterm setaf 2)
WHITE  := $(shell tput -Txterm setaf 7)
YELLOW := $(shell tput -Txterm setaf 3)
RED    := $(shell tput -Txterm setaf 1)
BLUE   := $(shell tput -Txterm setaf 5)
RESET  := $(shell tput -Txterm sgr0)


info:
	@echo Proyecto: $(PROJECT_NAME) ver.
