########################################
##            Variables               ##
########################################

PROJECT_NAME:=$(shell cat .project-name)
PROJECT_VERSION:=$(shell cat .project-version)


## Versión de python
VERSION_PYTHON:=$(shell cat .python-version)

SHELL := /bin/bash

########################################
##            Ayuda                   ##
########################################

help:   ##@ayuda Diálogo de ayuda
@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

info:
	@echo Proyecto: $(PROJECT_NAME) ver. $(PROJECT_VERSION)

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
