#!/bin/bash

osmo-trx-lms -C /config/osmo-trx.cfg &

osmo-bts-trx -c /config/osmo-bts.cfg &

osmo-pcu -c /config/osmo-pcu.cfg

