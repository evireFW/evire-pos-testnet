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

# Available Commands
```
docker-compose exec geth geth attach --exec "admin.peers" /root/.ethereum/geth.ipc
```

and see:
```
[{
    caps: ["eth/68", "snap/1"],
    enode: "enode://2cb6d2a84d927c4cf8794cd8985de3afa824472f13264e4fdf410e83cb056f59ee407e7297b8f12d298a5794f3f91c7bd75bbcb72456d35fbed7edfcae5836d1@37.27.118.184:30303",
    id: "37fd85d907ce2771d7fd1cd7390dca9f17f4349946bcdc05f53a88cc93790367",
    name: "Geth/v1.14.7-unstable-37590b2c/linux-amd64/go1.22.5",
    network: {
      inbound: false,
      localAddress: "172.18.0.2:43844",
      remoteAddress: "37.27.118.184:30303",
      static: false,
      trusted: false
    },
    protocols: {
      eth: {
        version: 68
      },
      snap: {
        version: 1
      }
    }
}]
```
```
docker-compose exec geth geth attach --exec "admin.nodeInfo" /root/.ethereum/geth.ipc
```

and see:
```
{
  enode: "enode://2dfbb3a40637dade2e3894c43cf92e998f68528a34c7a58808809c3df8bd8ae5542efe09c6d89063b695c9d856a1fb4982ed9931e7aa6061ad256bc1a0916276@65.21.25.235:30303",
  enr: "enr:-Ke4QG65XqiXVuI4WlZ9suebJffgyjPQzPYuTcAgWGo_2BdFdB9iNIn8dgatrlxNpoDXcRtYznY17E5fREIHriHt_IKGAZCl3vMig2V0aMvKhGcNMYCEZr6sZoJpZIJ2NIJpcIRBFRnriXNlY3AyNTZrMaECLfuzpAY32t4uOJTEPPkumY9oUoo0x6WICICcPfi9iuWEc25hcMCDdGNwgnZfg3VkcIJ2Xw",
  id: "1cca575df592cc6944ea49eb1185bfe092f8da4f4a5b5b6df8fab22d46ea8f0d",
  ip: "65.21.25.235",
  listenAddr: "[::]:30303",
  name: "Geth/v1.14.8-unstable-cf037849/linux-amd64/go1.22.5",
  ports: {
    discovery: 30303,
    listener: 30303
  },
  protocols: {
    eth: {
      config: {
        arrowGlacierBlock: 0,
        berlinBlock: 0,
        byzantiumBlock: 0,
        cancunTime: 1723772006,
        chainId: 787878,
        constantinopleBlock: 0,
        daoForkSupport: true,
        eip150Block: 0,
        eip155Block: 0,
        eip158Block: 0,
        grayGlacierBlock: 0,
        homesteadBlock: 0,
        istanbulBlock: 0,
        londonBlock: 0,
        muirGlacierBlock: 0,
        petersburgBlock: 0,
        shanghaiTime: 1720537190,
        terminalTotalDifficulty: 0,
        terminalTotalDifficultyPassed: true
      },
      difficulty: 1,
      genesis: "0xd8e3047433f21e3a4e08a8af235bdcafcd58edd1e00aeb8160265123a0990ff7",
      head: "0xd8e3047433f21e3a4e08a8af235bdcafcd58edd1e00aeb8160265123a0990ff7",
      network: 787878
    },
    snap: {}
  }
}
```

# Coming soon Features

- Validate blocks
