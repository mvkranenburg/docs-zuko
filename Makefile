# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

PROJECT       = zuko

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  clean      to remove everything in the build directory"

clean: sphinx-clean
html: sphinx-html
	@echo "\nCompressing pages in ${BUILDDIR}/$@/$(PROJECT).zip"
	@zip -jr ${BUILDDIR}/$@/$(PROJECT).zip ${BUILDDIR}/$@/$(PROJECT)

sphinx-%: Makefile
	@$(SPHINXBUILD) -M $* "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help clean html Makefile