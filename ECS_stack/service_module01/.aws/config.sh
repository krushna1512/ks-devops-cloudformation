#!/bin/bash
export SERVICE_NAME=ks-module
export CONTAINER_PORT=8156
export DATABASE_NAME=ks_core
export CPU=0
export MEMORY=10
export NPM_VERSION=$(awk -F\" '/"version":/ {print $4}' package.json)
