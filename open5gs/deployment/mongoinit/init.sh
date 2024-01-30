#!/bin/bash

#apt-get update 
#apt-get install -y git 
sleep 30
#cd /tmp 
#git clone https://github.com/open5gs/open5gs 
#mongosh --host=mongo:27017 -u root -p example --authenticationDatabase admin open5gs --eval 'db.createUser({ user: "open5gs", pwd: "open5gs", roles: [ { role: "readWrite", db: "open5gs" } ] })'
#mongosh --host=mongo:27017 -u root -p example --authenticationDatabase admin open5gs ./open5gs/docs/assets/webui/mongo-init.js
mongosh --host=mongo:27017 -u root -p example --authenticationDatabase admin open5gs /config/mongo-init.js