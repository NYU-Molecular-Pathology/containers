SHELL:=/bin/bash
VAR=
.PHONY: $(VAR)
none:

# ~~~~~ VALIDATION ~~~~~ #
check-Docker:
	@docker --version > /dev/null 2>&1 || { echo "ERROR: 'docker' not found" && exit 1 ; }

check-vagrant:
	@vagrant -v >/dev/null 2>&1 || { echo "ERROR: 'docker' not found" && exit 1 ; }

check-var:
	@test $(VAR) || (echo ">>> ERROR: VAR must be set for this; 'make <recipe> VAR=dir'" ; exit 1)

check-var-dir:
	@[ ! -d "$(VAR)" ] && { echo ">>> ERROR: VAR '$(VAR)' is not a directory" ; exit 1 ; } || :

check-singularityfile:
	@[ ! -f "$(SINGULARITYFILE)" ] && { echo ">>> ERROR: Singularity file '$(SINGULARITYFILE)' does not exist" ; exit 1 ; } || :

check-singularityimage:
	@[ ! -f "$(IMG)" ] && { echo ">>> ERROR: Singularity image file '$(IMG)' does not exist" ; exit 1 ; } || :

check-Dockerfile:
	@[ ! -f "$(DOCKERFILE)" ] && { echo ">>> ERROR: DOCKERFILE file '$(DOCKERFILE)' does not exist" ; exit 1 ; } || :

check-Docker-image:
	@docker image inspect "$(DOCKERTAG)" >/dev/null 2>&1

# ~~~~~~ SETUP ~~~~~ #
Vagrantfile:
	vagrant init singularityware/singularity-2.4

# ~~~~~~ CLEANUP ~~~~~ #
# seems to fix sporadic errors that arise when using Singularity inside Vagrant...
clean-vagrant:
	[ -d .vagrant ] && rm -rf .vagrant || :


# ~~~~~ SINGULARITY ~~~~~ #
SINGULARITYFILE:=$(VAR)/Singularity.$(VAR)
IMG:=$(VAR)/$(VAR).simg
TEST:=
singularity-build:
	@$(MAKE) check-var
	@$(MAKE) check-var-dir
	@$(MAKE) check-singularityfile
	@echo ">>> Setting up to build Singularity image in directory: $(VAR)"
	@[ -f "$(IMG)" ] && { echo ">>> Removing previous image file: $(IMG)" ; rm -f "$(IMG)" ; wait $$! ; } ; \
	echo ">>> Output file will be: $(IMG)" && \
	vagrant up build && \
	vagrant ssh build -c "cd /vagrant && sudo singularity build $(IMG) $(SINGULARITYFILE)" && \
	[ -n "$(TEST)" ] && $(MAKE) test || :

singularity-test:
	@$(MAKE) check-var
	@$(MAKE) check-var-dir
	@$(MAKE) check-singularityimage
	@echo ">>> Starting Vagrant..." && \
	vagrant up test && \
	vagrant ssh test -c "singularity shell /vagrant/$(IMG)"

# copy all image files to Big Purple HPC
USER:=$(shell echo $$USER)
REMOTE:=bigpurple.nyumc.org
REMOTEDIR:=/gpfs/home/$(USER)/containers/
singularity-sync:
	@$(MAKE) check-var
	@$(MAKE) check-singularityimage
	@echo 'command:'
	@echo 'rsync --dry-run -vrhP -e ssh $(IMG) $(USER)@$(REMOTE):$(REMOTEDIR)'

SINGULARITYCONTAINERS:=$(shell find . -mindepth 2 -type f -name "Singularity.*" ! -name "Singularity.base" ! -name "Singularity.R-3.2.3" ! -name "Singularity.multiqc-1.4" ! -name "Singularity.variant-calling-0.0.1" ! -name "Singularity.makefile" -exec bash -c 'basename $$(dirname {})' \;)
singularity-build-all:
	containers="$(SINGULARITYCONTAINERS)" ;\
	for item in $${containers}; do \
	echo "$$item" ;\
	done
# $(MAKE) singularity-build VAR=$${item}

# build a Singularity container using the Docker image containing Singularity
SINGULARITYDIR:=$(shell python -c 'import os; print(os.path.realpath("$(VAR)"))')
SINGULARITYIMGDOCKER:=$(VAR).simg
SINGULARITYFILEDOCKER:=Singularity.$(VAR)
SINGULARITYDOCKERTAG:=stevekm/containers:Singularity-2.4
singularity-build-docker:
	@$(MAKE) check-var
	@$(MAKE) check-var-dir
	@$(MAKE) check-Docker-image DOCKERTAG=$(SINGULARITYDOCKERTAG)
	@[ -f "$(IMG)" ] && { echo ">>> Removing previous image file: $(IMG)" ; rm -f "$(IMG)" ; wait $$! ; } ; \
	docker run --privileged --rm -ti -v "$(SINGULARITYDIR):/image" "$(SINGULARITYDOCKERTAG)" bash -c 'cd /image && sudo singularity build $(SINGULARITYIMGDOCKER) $(SINGULARITYFILEDOCKER)'

# ~~~~~ DOCKER ~~~~~ #
DOCKERFILE:=$(VAR)/Dockerfile
DOCKERREPO:=stevekm/containers
DOCKERTAG:=$(DOCKERREPO):$(VAR)
docker-build:
	@$(MAKE) check-Docker
	@$(MAKE) check-var
	@$(MAKE) check-var-dir
	@$(MAKE) check-Dockerfile
	cd $(VAR) && \
	docker build -t "$(DOCKERTAG)" .

docker-test:
	@$(MAKE) check-Docker-image || { echo ">>> Docker image does not exist, building...";  $(MAKE) docker-build; }
	@docker run --rm -ti "$(DOCKERTAG)" bash
