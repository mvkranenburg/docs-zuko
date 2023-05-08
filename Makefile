# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  clean      to remove everything in the build directory"

clean: sphinx-clean
html: sphinx-html
	@for d in $(BUILDDIR)/$@/*/ ; do \
		echo "\nCompressing pages in $${d%/}.zip" ; \
		zip -jr $${d%/}.zip $${d} ; \
	done

sphinx-%: Makefile
	@$(SPHINXBUILD) -M $* "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help clean html Makefile