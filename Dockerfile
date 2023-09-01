#
# Elasticsearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM ubuntu:latest

ENV ES_PKG_NAME elasticsearch-8.9.1-linux-x86_64

# Install Elasticsearch.
RUN \
  cd / && \
  wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.9.1-linux-x86_64.tar.gz && \
  tar xvzf elasticsearch-8.9.1-linux-x86_64.tar.gz && \
  rm -f elasticsearch-8.9.1-linux-x86_64.tar.gz && \
  mv /elasticsearch-8.9.1-linux-x86_64.tar.gz /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
