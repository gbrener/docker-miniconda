# docker-miniconda
Docker image for Miniconda


# Usage

The main image is meant to be used as a base image, but it can also be run directly:

```
docker run -it gbrener/miniconda:3 /bin/bash
```

An example of a Dockerfile inheriting from the base image is in _Dockerfile.example_.


# Development

```
docker build -t miniconda:3 - < ./Dockerfile
```

```
docker build -t conda_test - < ./Dockerfile.example
```
