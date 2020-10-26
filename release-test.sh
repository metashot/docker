#!/bin/bash

TOOLNAME=$1
VERSION=$2

REGISTRY="metashot"
DOCKERPATH="dockerfiles/${TOOLNAME}/${VERSION}"

echo Building $TOOLNAME $VERSION

docker build --rm -t ${REGISTRY}/${TOOLNAME}:${VERSION} ${DOCKERPATH}

