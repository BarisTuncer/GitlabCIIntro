# GitlabCIIntro

Using Gitlab CI for github repos, intro


# use the official gcc image, based on debian
# can use verions as well, like gcc:5.2
# see https://hub.docker.com/_/gcc/
image: ubuntu:16.04

build:
  stage: build
  # instead of calling g++ directly you can also use some build toolkit like make
  # install the necessary build tools when needed
  before_script: 
    - apt update && apt -y install make autoconf gcc g++
  script: 
    - g++ -Wall --coverage -fprofile-arcs -ftest-coverage helloworld.cpp -o mybinary
    - ls
  artifacts:
    paths:
      - mybinary
  # depending on your build setup it's most likely a good idea to cache outputs to reduce the build time
  # cache:
  #   paths:
  #     - "*.o"

# run tests using the binary built before
test:
  stage: test
  script:
    - bash runmytests.sh

coverage:
  stage: deploy
  before_script:
    - apt-get -qq update && apt-get -qq install -y make autoconf gcc g++ gcovr ggcov lcov
  script:
    - ls
    - g++ -Wall --coverage -fprofile-arcs -ftest-coverage helloworld.cpp -o mybinary
    - ./mybinary
    - ls
    - gcov helloworld.cpp
    - lcov --directory . --capture --output-file coverage.info
    - lcov --list coverage.info