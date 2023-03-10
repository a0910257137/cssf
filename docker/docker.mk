
DOCKER_MK_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

# Docker
DOCKER_CPUS ?= k8 armv7a armv6 aarch64
DOCKER_TARGETS ?=
DOCKER_IMAGE ?= ubuntu:16.04
DOCKER_TAG_BASE ?= "xilinix-cross"
DOCKER_TAG := "$(DOCKER_TAG_BASE)-$(subst :,-,$(DOCKER_IMAGE))"
DOCKER_SHELL_COMMAND ?=

ifndef DOCKER_WORKSPACE
$(error DOCKER_WORKSPACE is not defined)
endif

WORKSPACE := /workspace
MAKE_COMMAND := \
for cpu in $(DOCKER_CPUS); do \
    make CPU=\$${cpu} COMPILATION_MODE=$(COMPILATION_MODE) -C /workspace $(DOCKER_TARGETS) || exit 1; \
done

define run_command
chmod a+w /; \
groupadd --gid $(shell id -g) $(shell id -g -n); \
useradd -m -e '' -s /bin/bash --gid $(shell id -g) --uid $(shell id -u) $(shell id -u -n); \
echo '$(shell id -u -n) ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers; \
su $(shell id -u -n) $(if $(1),-c '$(1)',)
endef

docker-image:
	docker build $(DOCKER_IMAGE_OPTIONS) -t $(DOCKER_TAG) \
	    --build-arg IMAGE=$(DOCKER_IMAGE) $(DOCKER_MK_DIR)