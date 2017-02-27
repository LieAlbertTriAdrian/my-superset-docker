# My Superset #
Superset is a data exploration platform designed to be visual, intuitive and interactive, built by AirBnB.

## Instructions ##

#### Build my-superset image from Dockerfile ####
`docker build -f Dockerfile -t my-superset .`

#### Run the my-superset image into docker container ####
`docker run --name my-superset-container-name -p 8082:8080 -d my-superset`

Reference: https://github.com/airbnb/superset