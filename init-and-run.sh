#!/bin/sh

# Initialize Geth from genesis file
geth init --datadir /root/.ethereum /genesis.json

# Launch Geth with Evire specification
exec geth \
  --datadir /root/.ethereum \
  --networkid 787878 \
  --syncmode full \
  --http \
  --http.addr 0.0.0.0 \
  --http.vhosts '*' \
  --http.corsdomain '*' \
  --http.api eth,net,engine,admin \
  --ws \
  --ws.addr 0.0.0.0 \
  --ws.origins '*' \
  --ws.api eth,net,engine \
  --authrpc.addr 0.0.0.0 \
  --authrpc.vhosts '*' \
  --authrpc.jwtsecret /root/.ethereum/jwtsecret \
  --bootnodes enode://2cb6d2a84d927c4cf8794cd8985de3afa824472f13264e4fdf410e83cb056f59ee407e7297b8f12d298a5794f3f91c7bd75bbcb72456d35fbed7edfcae5836d1@37.27.118.184:30303 \
  --port 30303 \
  "$@"
