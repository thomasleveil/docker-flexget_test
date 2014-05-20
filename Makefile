.PHONY: build shell run

DOCKER_IMAGE := tomdesinto/flexget_tests

build:
	docker build --rm --tag "$(DOCKER_IMAGE)" .

run:
	docker run --tty --interactive "$(DOCKER_IMAGE)" && (CID=$$(docker ps -lq); [ $$(docker wait $$CID) -eq 0 ] && docker rm $$CID || echo keeping container $$CID for inspection)

shell:
	docker run --rm --tty --interactive "$(DOCKER_IMAGE)" -l
