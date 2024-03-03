.PHONY: build

build:
	./build.sh

stop:
	docker stop sandbox-container-1

rm:
	docker rm sandbox-container-1
