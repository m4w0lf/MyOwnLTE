#!/bin/bash


docker build --network=host -t registry.the-resolvers.net/osmocom/osmo-cbc:latest .
docker push registry.the-resolvers.net/osmocom/osmo-cbc:latest
