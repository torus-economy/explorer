#!/bin/bash

while [ true ]
do
    nodejs scripts/peers.js
    nodejs scripts/sync.js index update
    sleep 60
done
