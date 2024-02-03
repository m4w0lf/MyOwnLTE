#!/bin/bash

export DISPLAY=:0

echo /opt/srsRAN/lib/ > /etc/ld.so.conf.d/srsenb.conf 

ldconfig

/opt/srsRAN/bin/srsenb /config/enb.conf