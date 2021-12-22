#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

echo
echo
echo ---------------------------------------------------------
echo "Step 1: Setting Domain To Ip Address"
echo
echo ---------------------------------------------------------
echo

near call mnkhod.testnet setDomain '{"domainName":"mnkhod","domainIPAddress":"142.250.72.100"}' --accountId mnkhod.testnet 

echo
echo
echo ---------------------------------------------------------
echo "Step 2: Calling getDomain on the domain we registered "
echo
echo ---------------------------------------------------------
echo

near call mnkhod.testnet getDomain '{"domainName":"mnkhod"}' --accountId mnkhod.testnet 

echo
echo
exit 0
