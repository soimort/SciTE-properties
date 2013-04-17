.PHONY: default install patches upgrade

default:

install:
	./copy_properties.sh

patches:
	@(rm -f patches/*; cd new/; \
	for FILE in *; do \
		OLD="../old/$$FILE"; \
		if [ ! -f $$OLD ]; then OLD="/dev/null"; fi; \
		s=`diff -u $$OLD $$FILE`; \
		if [[ $$s != "" ]]; then \
			diff -u $$OLD $$FILE \
				> ../patches/$$FILE.patch; \
		fi; \
	done)

upgrade: patches
	@rm -fr properties/*
	@cp -r old/* properties/
	@./patch_properties.sh
	@./copy_properties.sh
