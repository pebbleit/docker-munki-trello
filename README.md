# docker-munki-trello

This Docker image runs pebble.it's [munki-trello](https://github.com/pebbleit/munki-trello) script. For more information about it's operation and on how to obtain the needed key and token, see the Readme for the origiginal repository.

# Settings

Several options are customizable using environment variables.

* ``DOCKER_TRELLO_KEY``: The API Key
* ``DOCKER_TRELLO_TOKEN``: The Trello Application Token.
* ``DOCKER_TRELLO_BOARDID``: The Trello Board ID.
* ``DOCKER_TRELLO_TO_DEV_LIST``: The name of the 'To Development' list. Defaults to ``To Development``.
* ``DOCKER_TRELLO_DEV_LIST``: The name of the 'Development' list. Defaults to ``Development``.
* ``DOCKER_TRELLO_TO_TEST_LIST``: The name of the 'To Testing' list. Defaults to ``To Testing``.
* ``DOCKER_TRELLO_TEST_LIST``: The name of the 'Testing' list. Defaults to ``Testing``.
* ``DOCKER_TRELLO_TO_PROD_LIST``: The name of the 'To Production' list. Defaults to ``To Production``.
* ``DOCKER_TRELLO_MUNKI_PATH``: The path in the container to the Munki repository. Defaults to ``/munki_repo``.


#Running the container

It's recommended to run this container using the ``--rm`` option so the container is destroyed after the script has run.

```bash
$ docker pull pebbleit/munki-trello
$ docker run --rm \
  -v /var/www/munki:/munki_repo \
  -e DOCKER_TRELLO_KEY=yourapikey \
  -e DOCKER_TRELLO_TOKEN=yourtoken \
  -e DOCKER_TRELLO_BOARDID=abc123 \
  pebbleit/munki-trello
```

#TODO

* Add support for SQLite and MySQL
