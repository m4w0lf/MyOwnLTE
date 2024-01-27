#!/bin/bash


docker build --network=host -t registry.the-resolvers.net/osmocom/osmo-hlr:latest .
docker push registry.the-resolvers.net/osmocom/osmo-hlr:latest
