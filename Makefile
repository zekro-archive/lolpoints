MIX = mix


.PHONY: build run deps prod

build:
	$(MIX) build

prod:
	MIX_ENV=prod $(MIX) build

run:
	CONFIG_FILE=$(CURDIR)/config/config.yml \
		$(MIX) run --no-halt
	
deps:
	$(MIX) deps.get