#!/bin/bash
set -e
if [ "$1" = 'bitcoind' ]; then
    if [ ! -d "$BITCOIN_DATA" ]; then
        echo "Please configure a docker volume at $BITCOIN_DATA"
        exit 1
    fi
    if [[ ! -s "$BITCOIN_DATA/bitcoin.conf" ]]; then
		cat <<-EOF > "$BITCOIN_DATA/bitcoin.conf"
		testnet=${BITCOIN_TESTNET}
		rpcport=${BITCOIN_RPC_PORT}
		rpcuser=${BITCOIN_RPC_USER:-rpcuser}
		rpcpassword=${BITCOIN_RPC_PASSWORD:-rpcpass}
		rpcallowip=::/0
		EOF
	fi
	exec bitcoind -server -printtoconsole -datadir="${BITCOIN_DATA}"
fi
exec "$@"