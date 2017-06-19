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

## NOTE: Las categorías de ayuda se definen con ##@categoria
HELP_FUN = \
    %help; \
    while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-z0-9_\-]+)\s*:.*\#\#(?:@([a-z0-9_\-]+))?\s(.*)$$/ }; \
    print "uso: make [target]\n\n"; \
    for (sort keys %help) { \
    print "${BOLD}${WHITE}$$_:${RESET}\n"; \
    for (@{$$help{$$_}}) { \
    $$sep = " " x (32 - length $$_->[0]); \
    print "  ${BOLD}${BLUE}$$_->[0]${RESET}$$sep${GREEN}$$_->[1]${RESET}\n"; \
    }; \
    print "\n"; }

help:   ##@ayuda Diálogo de ayuda
@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

info:
	@echo Proyecto: $(PROJECT_NAME) ver. 

########################################
##      Tareas del Proyecto           ##
########################################

set_project_name: ##@proyecto Renombra el proyecto con PROJECT_NAME
  ## Basado en http://stackoverflow.com/a/39284776/754176
	@ag [dD]ummy -l0 | xargs -0 sed -i  "s/[dD]ummy/${PROJECT_NAME}/g"
  ## Renombrar la carpeta del proyecto
	@if [ -d dummy ] ; then \
     mv dummy/pipelines/dummy.py dummy/pipelines/$(PROJECT_NAME).py ; \
     mv dummy $(PROJECT_NAME) ; \
fi;
