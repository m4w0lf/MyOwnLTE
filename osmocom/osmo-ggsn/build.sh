#!/bin/bash


docker build --network=host -t registry.the-resolvers.net/osmocom/osmo-ggsn:latest .
docker push registry.the-resolvers.net/osmocom/osmo-bsc:latest
