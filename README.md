# Corese: Semantic Web Factory (triple store & SPARQL endpoint) implementing RDF, RDFS, SPARQL 1.1 Query & Update
[![Docker Build](https://img.shields.io/docker/pulls/xgaia/corese.svg)](https://hub.docker.com/r/xgaia/corese/)
[![Build Status](https://travis-ci.org/xgaia/docker-corese.svg?branch=master)](https://travis-ci.org/xgaia/docker-corese)
## Pull from dockerHub

    docker pull xgaia/corese

## Or build

    # Clone the repo
    git clone https://github.com/xgaia/docker-corese.git
    cd docker-corese
    docker build -t corese .

## Run

    docker run --name corese -p 8080:8080 -d xgaia/corese

