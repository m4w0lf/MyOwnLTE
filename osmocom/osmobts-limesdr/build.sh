#!/bin/bash


docker build --network=host -t registry.the-resolvers.net/osmocom/osmobts-limesdr:latest .
docker push registry.the-resolvers.net/osmocom/osmobts-limesdr:latest
