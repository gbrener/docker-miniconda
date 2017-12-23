FROM debian:stable-slim

# Set default username to "conda", default version to "3"
ARG MINICONDA_GROUP=conda
ARG MINICONDA_VER=3

ENV DEBIAN_FRONTEND=noninteractive

# Create $MINICONDA_GROUP group:
RUN groupadd -r $MINICONDA_GROUP

# Install miniconda
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends locales ca-certificates curl bzip2 && \
    localedef -i en_US -c -f UTF-8 en_US.UTF-8 && \
    curl -LO https://repo.continuum.io/miniconda/Miniconda$MINICONDA_VER-latest-Linux-x86_64.sh && \
    bash Miniconda$MINICONDA_VER-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda$MINICONDA_VER-latest-Linux-x86_64.sh && \
    /opt/conda/bin/conda clean --all -y && \
    chown -R :$MINICONDA_GROUP /opt/conda && \
    chmod -R 2775 /opt/conda && \
    apt-get purge -y --auto-remove ca-certificates curl bzip2 && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* /usr/share/man/* /usr/share/doc/* /var/log/* /usr/share/locale/[^e]* /usr/share/locale/e[^n]* /usr/share/info/*

# Set locales
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8
