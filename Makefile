VAR=
none:

.PHONY: base bcftools-1.7


check-docker:
	docker --version > /dev/null 2>&1 || { echo "ERROR: 'docker' not found" && exit 1 ; }

# ~~~~~ BUILD DOCKER CONTAINERS ~~~~~ #
base: check-docker
	cd base && docker build -t stevekm/containers:base .

bcftools-1.7: check-docker
	cd bcftools-1.7 && docker build -t stevekm/containers:bcftools-1.7 .

# ~~~~~~~ SETUP DOCKER CONTAINERS ~~~~~ #
build: base

build-$(VAR): base
	cd $(VAR) && docker build -t stevekm/containers:$(VAR) .

# ~~~~~~ TEST CONTAINERS ~~~~~ #
test-base: base
	docker run --rm -ti stevekm/containers:base bash

test: build-$(VAR)
	docker run --rm -ti stevekm/containers:$(VAR) bash
