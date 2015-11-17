PACKAGE = arsen/elasticsearch-k8s
TAG := dev

DEV_FOLDER := 2.0

build:
	docker build --rm -t ${PACKAGE}:${TAG} ${DEV_FOLDER}
.PHONY: build
