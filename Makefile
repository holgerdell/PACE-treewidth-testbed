.PHONY: help
help:
	@echo "make help\n  Print this message\n"
	@echo "make download\n  Download PACE2016 submissions and td-validate\n"
	@echo "make make\n  Compile all downloaded programs\n"
	@echo "make run_pace16\n  Run all PACE2016 submissions on all instances\n"
	@echo "make td-validate\n  Download td-validate only\n"
	@echo "make clean\n  Delete all downloaded and compiled files\n"

get:=scripts/get pace2016-submissions.yaml
submissions:=$(shell $(get))
DIRS=td-validate.git $(submissions:=.git)

.PHONY: download
download: $(DIRS)

%.git:
	git clone -q $(shell $(get) $* git) $@
	cd $@; git reset -q --hard $(shell $(get) $* commit) 

td-validate.git:
	git clone -q https://github.com/holgerdell/td-validate/ td-validate.git

.PHONY: make
make:
	for d in $(DIRS); do \
		if ! scripts/do_make $$d; then exit 1; fi; \
	done

.PHONY: clean
clean:
	@echo Removing all downloaded and compiled files...
	rm -rf $(DIRS)

run_pace16:
	scripts/run_pace16
