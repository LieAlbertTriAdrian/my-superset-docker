# My Caravel Docker #
Caravel is a data exploration platform designed to be visual, intuitive and interactive, built by AirBnB.
This is a Dockerfile to build Caravel.

## Instructions ##

#### Build mycaravel image from Dockerfile ####
`docker build -f Dockerfile -t mycaravel .`

#### Run the mycaravel image into docker container ####
`docker run -p 8081:8088 -d mycaravel`

Reference: https://github.com/airbnb/caravel