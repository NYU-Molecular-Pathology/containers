# Software Containers

This repository contains [Docker](https://docs.docker.com/get-started/) and [Singularity](https://www.sylabs.io/guides/2.5/user-guide/quick_start.html) recipes to build software containers for use with sequencing and data analysis.

- NOTE: These instructions are designed to be used from a Mac computer. They should also work on Linux systems but many methods will be unnecessary on Linux.

# Usage

First, clone this repository:

```
git clone https://github.com/NYU-Molecular-Pathology/containers.git
cd containers
```

The included `Makefile` contains the commands needed to build and test containers in this repository.

It is recommended to build containers one at a time, and test each one after building.

## Singularity

Singularity containers are meant to be used on HPC, where Docker is not allowed. Singularity containers must be built on a system to which you have root (admin) access e.g. your desktop computer. Singularity itself can only be run natively in a Linux environment. To build a Singularity container from your Mac desktop, you need either Vagrant or Docker installed, in which to run Singularity. Instructions for building Singularity containers using both are included. Recipes to create Singularity containers are saved in files named `Singularity` or `Singularity.image-tag-name`, such as `Singularity.GATK-3.8`. The output will consist of an image file (`.simg`), which must be transferred to your target system for use.

### Build Singularity containers with Vagrant

Vagrant needs to be installed on your Mac (see installation instructions in the included file `VAGRANT.md`). The file `Vagrantfile` included in this repository provides the definitions for the virtual machines to be used for building and testing Singularity containers.

#### Build

To build a Singularity container using Vagrant, run a command such as the following:

```
make singularity-build VAR=<dirname>
```

Where `VAR` is the name of the directory in this repository that contains the recipe for the Singularity container you wish to build. For example:

```
make singularity-build VAR=sambamba-0.6.6
```

- NOTE: If your builds start failing randomly or you start getting strange errors inside your containers, try removing the reference to your Vagrant VM (`make clean-vagrant`) and try again. Be sure to remove old Vagrant VM's from VirtualBox if you do this.

- NOTE: Some Singularity recipes that pull from Docker images tend to fail when building with Vagrant, try building with the Docker container as described further below.

#### Test

To test a Singularity container that you have built, you can use the following command:

```
make singularity-test VAR=<dirname>
```

This will load an interactive shell session inside the target container, where you can verify that your software is present and operational.

### Build Singularity containers with Docker

You can build Singularity containers using [Docker](https://docs.docker.com/docker-for-mac/install/). First, you need to build a Docker container that contains Singularity:

```
make docker-build VAR=Singularity-2.4
```

#### Build

You can build a Singularity container using Docker with the following command:

```
make singularity-build-docker VAR=<dirname>
```

You can adjust the container tag using the `DOCKERREPO` ('stevekm/containers') or `DOCKERTAG` ('stevekm/containers:container-name') Makefile variables.

### Sync

To copy a Singularity container to your target system, you can generate a template `rsync` command with:

```
make singularity-sync VAR=<dirname>
```

This will print out a template command to transfer your container file via `rsync` & ssh to your target system. For example:

```
$ make singularity-sync VAR=sambamba-0.6.6
command:
rsync --dry-run -vrhP -e ssh sambamba-0.6.6/sambamba-0.6.6.simg kellys04@bigpurple.nyumc.org:/gpfs/home/kellys04/containers/
```

You can specify the username, server address, and server destination path with `Makefile` variables like this:

```
$ make singularity-sync VAR=sambamba-0.6.6 USER=bob REMOTE=some.server.com REMOTEDIR=/path/to/containers/
command:
rsync --dry-run -vrhP -e ssh sambamba-0.6.6/sambamba-0.6.6.simg bob@some.server.com:/path/to/containers/
```

You will want to copy & paste this to run this with `--dry-run` as shown first, then run again without it when you are sure the transfer looks correct.

# Docker Containers

The following Docker containers are included for special purposes:

- `Singularity-2.4`: used to build Singularity containers

- `Miniconda3-4.4.10`: used as a scratch-pad test container to interactively determine compatible versions of `conda` libraries for installation in other containers

## Build

Docker containers can be built with the following command:

```
make docker-build VAR=<dirname>
```

## Test

Docker containers can be tested with the following command:

```
make docker-test VAR=<dirname>
```

This will start an interactive shell in the container, where you can verify that your software works.

# Software

- Docker version 17.12.0-ce, build c97c6d6

- Vagrant 2.0.1

- VirtualBox Version 5.2.2 r119230 (Qt5.6.3)

- Singularity 2.4 (build), 2.5.2 (run)

- macOS 10.10, 10.12.6

- GNU Make 3.81

- GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin16)
