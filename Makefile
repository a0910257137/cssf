SHELL := /bin/bash
MAKEFILE_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
OS := $(shell uname -s)
DOCKER_WORKSPACE=$(MAKEFILE_DIR)
DOCKER_CPUS=aarch64
DOCKER_TAG_BASE=cssf
include $(MAKEFILE_DIR)/docker/docker.mk
