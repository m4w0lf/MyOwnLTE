#!/bin/bash

ip link set ogstun up

ip addr add 9.9.9.9/32 dev ogstun

ip route add 100.64.0.0/16 dev ogstun

