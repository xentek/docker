IMG=xentek/node
NAME=xentek-node
TAG=latest

.PHONY: pull build create destroy run tag release
.DEFAULT_GOAL := default

default:
	@ mmake help

# release all tags
all:
	$(MAKE) release
	$(MAKE) release TAG=12.15.0

# pull the Docker container
#
# arguments:
#
#   - TAG: tag the container. default: latest
pull:
	docker pull ${IMG}:${TAG}

# build the Docker container
build:
	docker build -t ${IMG} .

# create the Docker container
#
# arguments:
#
#   - NAME: name of container. default: xentek-node
create: destroy build
	docker create -it --init --name "${NAME}" ${IMG}

# destroy the Docker container
#
# arguments:
#
#   - NAME: name of container. default: xentek-node
destroy:
	docker rm -v $(shell docker ps -aqf "name=${NAME}") || (exit 0)

# run the Docker container
#
# arguments:
#
#   - NAME: name of container. default: xentek-node
run: create
	docker start -ai ${NAME}

# tag the Docker container
#
# arguments:
#
#   - TAG: tag the container. default: latest
tag: build
	docker tag ${IMG} ${IMG}:${TAG}

# release the Docker container
#
# arguments:
#
#   - TAG: tag the container. default: latest
release: tag
	docker push ${IMG}:${TAG}

