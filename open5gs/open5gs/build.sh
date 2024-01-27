#!/bin/bash


docker build -t registry.the-resolvers.net/open5gs/open5gs-base:latest .
docker push registry.the-resolvers.net/open5gs/open5gs-base:latest
