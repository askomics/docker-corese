# [Corese](https://github.com/Wimmics/corese): Semantic Web Factory (triple store & SPARQL endpoint) implementing RDF, RDFS, SPARQL 1.1 Query & Update
[![Docker Build](https://img.shields.io/docker/pulls/xgaia/corese.svg)](https://hub.docker.com/r/xgaia/corese/)
[![Build Status](https://travis-ci.org/xgaia/docker-corese.svg?branch=master)](https://travis-ci.org/xgaia/docker-corese)

## Pull from dockerHub

```bash
docker pull xgaia/corese
```

## Or build

```bash
# Clone the repo
git clone https://github.com/xgaia/docker-corese.git
cd docker-corese
docker build -t corese .
```

## Run

```bash
docker run --name corese -p 8080:8080 -d xgaia/corese
```

## Run and load data

At start, corese load all files in `/load`. Mount a directory with rdf file to load them at corese start

- Load a rdf file

```bash
docker run --name corese -p 8080:8080 -v path/to/file.ttl:/load/file.ttl -d xgaia/corese
```

- Load a directory full of rdf file

```bash
docker run --name corese -p 8080:8080 -v path/to/dir:/load/ -d xgaia/corese
```
