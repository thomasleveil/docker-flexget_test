Flexget test
============

Builds an docker image which is able to run tests for the [Flexget](http://flexget.com/) project.

The aim is to get a consistent environment ready to fire up the test suite in seconds.

To upgrade the dependencies, rebuild the container image.


Running the tests
-----------------

Running the docker container will update the Flexget code against the `develop` branch and
run the test suite.

    docker run tomdesinto/flexget_test

This will run `nosetest --attr !online`


If you want to pass additional command line parameters to `nosetest`, add them to the docker run command.
Let say you want to run the tests in parallel over 4 processes, then run the container with:

    docker run tomdesinto/flexget_test --processes=4


To get the list of parameters you can pass, just run the container with the `--help` parameter:

    docker run --rm tomdesinto/flexget_test --help



Building the docker image
-------------------------

    docker build -t tomdesinto/flexget_test https://github.com/thomasleveil/docker-flexget_test.git

If you want to hack the Dockerfile, then checkout the project and call `make build`

```bash
git clone https://github.com/thomasleveil/docker-flexget_test.git
cd docker-flexget_test
make build
```


Tips
----

Run the container with the `--tty --interactive` (or `-it`) parameters to be able to interrupt the test suite
with Ctrl-C:

    docker run -it tomdesinto/flexget_test


