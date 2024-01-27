#!/bin/bash


docker build -t registry.the-resolvers.net/open5gs/open5gs-webui:latest .
docker push registry.the-resolvers.net/open5gs/open5gs-webui:latest
