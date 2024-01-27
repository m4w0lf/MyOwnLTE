#!/bin/bash

docker build -t registry.the-resolvers.net/open5gs/srsran-limesdr:latest .
docker push registry.the-resolvers.net/open5gs/srsran-limesdr:latest
