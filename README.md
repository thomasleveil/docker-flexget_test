Flexget test
============

Builds an docker image which is able to run tests for the [Flexget](http://flexget.com/) project.

The aim is to get a consistent environment ready to fire up the test suite in seconds.

To upgrade the dependencies, rebuild the container image.


Building a docker image
-----------------------

```bash
git clone https://github.com/thomasleveil/docker-flexget_test.git
cd docker-flexget_test
make build
```


Running the tests in a docker container
---------------------------------------

```bash
make run
```

Running the container does differents things:
- sync the code against https://github.com/Flexget/Flexget develop branch
- display the output of `pip freeze`
- run nosetests
