DOCKER_USER=pebbleit
NAME:=munki-trello
TO_DEV_LIST:=To Development
DEV_LIST:=Development
TO_TEST_LIST:=To Testing
TEST_LIST:=Testing
TO_PROD_LIST:=To Production
MUNKI_PATH:=/munki_repo
SUFFIX:=Production
KEY:=
BOARDID:=
TOKEN:=
DOCKER_RUN_COMMON=--name="$(NAME)" -e TO_DEV_LIST=${TO_DEV_LIST} -e DEV_LIST=${DEV_LIST} -e TO_TEST_LIST=${TO_TEST_LIST} -e TEST_LIST=${TEST_LIST} -e TO_PROD_LIST=${TO_PROD_LIST} -e KEY=${KEY} -e BOARDID=${BOARDID} -e TOKEN=${TOKEN} ${DOCKER_USER}/${NAME}


all: build

build:
	docker build -t="${DOCKER_USER}/${NAME}" .

build-nocache:
	docker build --no-cache=true -t="${DOCKER_USER}/${NAME}" .

run:
	docker run -d ${DOCKER_RUN_COMMON}

interactive:
	docker run -i ${DOCKER_RUN_COMMON}

bash:
	docker run -t -i ${DOCKER_RUN_COMMON} /bin/bash

clean:
	docker stop proxy
	docker rm proxy

rmi:
	docker rmi ${DOCKER_USER}/${NAME}