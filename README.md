# EVIRE Proof-of-Stake Testnet

This repository provides a docker-compose file to run a geth node for EVIRE Testnet. This configuration uses [Prysm](https://github.com/prysmaticlabs/prysm) as a consensus client and [go-ethereum](https://github.com/ethereum/go-ethereum) for execution. 


## Using

First, install Docker. Then, run:

```
git clone https://github.com/evireFW/evire-pos-testnet && cd evire-pos-testnet
./clean.sh
docker-compose build
docker-compose up -d
```

You will see the following:

```
$ docker compose up -d
Creating network "evire-pos-testnet_default" with the default driver
Creating volume "evire-pos-testnet_execution" with default driver
Creating volume "evire-pos-testnet_consensus" with default driver
Creating evire-pos-testnet_geth_1 ... done
Creating evire-pos-testnet_beacon-chain_1 ... done
```

Each time you restart, you can wipe the old data using `./clean.sh`.

Next, you can inspect the logs of the different services launched. 

```
docker logs evire-pos-testnet_geth_1 -f
```

and see:

```
INFO [07-12|07:36:10.244] Starting peer-to-peer node               instance=Geth/v1.14.8-unstable-cf037849/linux-amd64/go1.22.5
INFO [07-12|07:36:10.275] New local node record                    seq=1,720,769,770,273 id=1cca575df592cc69 ip=127.0.0.1 udp=30303 tcp=30303
INFO [07-12|07:36:10.276] Started P2P networking                   self=enode://2dfbb3a40637dade2e3894c43cf92e998f68528a34c7a58808809c3df8bd8ae5542efe09c6d89063b695c9d856a1fb4982ed9931e7aa6061ad256bc1a0916276@127.0.0.1:30303
INFO [07-12|07:36:10.282] IPC endpoint opened                      url=/root/.ethereum/geth.ipc
INFO [07-12|07:36:10.283] Loaded JWT secret file                   path=/root/.ethereum/jwtsecret crc32=0xcfbeb5ea
INFO [07-12|07:36:10.284] HTTP server started                      endpoint=[::]:8545 auth=false prefix= cors=* vhosts=*
INFO [07-12|07:36:10.284] WebSocket enabled                        url=ws://[::]:8546
INFO [07-12|07:36:10.284] WebSocket enabled                        url=ws://[::]:8551
INFO [07-12|07:36:10.284] HTTP server started                      endpoint=[::]:8551 auth=true  prefix= cors=localhost vhosts=*
INFO [07-12|07:36:11.447] New local node record                    seq=1,720,769,770,274 id=1cca575df592cc69 ip=65.21.25.235 udp=30303 tcp=30303
INFO [07-12|07:36:20.290] Looking for peers                        peercount=1 tried=99 static=0
INFO [07-12|07:36:30.296] Looking for peers                        peercount=1 tried=220 static=0
```

# Available Features

- Connect to Evire Testnet Geth and attach a new node
