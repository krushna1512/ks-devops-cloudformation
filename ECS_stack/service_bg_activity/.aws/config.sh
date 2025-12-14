#!/bin/bash
export SERVICE_NAME=ks
export CONTAINER_PORT=8177
export DATABASE_NAME=ks
export CPU=0
export MEMORY=10
export AWS_REGION=ap-south-1
export NPM_VERSION=$(awk -F\" '/"version":/ {print $4}' package.json)
