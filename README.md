# bitcoind docker service
Alpine Linux based, small and robust.

## docker-compose.yml sample
```
version: "3"
services:
  bitcoind:
    image: yarcode/bitcoind
    command: bitcoind
    volumes:
      - bitcoin_data:/var/lib/bitcoin
    env_file:
      - .env
    environment:
      - BITCOIN_RPC_USER
      - BITCOIN_RPC_PASSWORD
      - BITCOIN_RPC_PORT
      - BITCOIN_RPC_ALLOW_IP
      - BITCOIN_REGTEST
      - BITCOIN_TESTNET
    ports:
      - "${BITCOIN_RPC_PORT}:${BITCOIN_RPC_PORT}"
volumes:
  bitcoin_data:
    external: true
```
## Environment variables and defaults
```
BITCOIN_RPC_USER=rpcuser
BITCOIN_RPC_PASSWORD=rpcpass
BITCOIN_RPC_PORT=8332
BITCOIN_RPC_ALLOW_IP=::/0
BITCOIN_TESTNET=0
BITCOIN_REGTEST=0
```
## Volume configuration
This image requires an external volume to be bound at the `/var/lib/bitcoin` directory.

## Links
* https://github.com/yarcode/docker-bitcoind
* https://hub.docker.com/r/yarcode/bitcoind/