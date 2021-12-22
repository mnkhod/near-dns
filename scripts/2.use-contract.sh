#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

echo
echo ---------------------------------------------------------
echo "Step 0: Check for environment variable with contract name"
echo ---------------------------------------------------------
echo

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$CONTRACT" ] || echo "Found it! \$CONTRACT is set to [ $CONTRACT ]"

echo
echo
echo ---------------------------------------------------------
echo "Step 1: Setting Domain To Ip Address"
echo
echo ---------------------------------------------------------
echo

near call $CONTRACT setDomain '{"domainName":"mnkhod","domainIPAddress":"142.250.72.100"}' --accountId $CONTRACT

echo
echo
echo ---------------------------------------------------------
echo "Step 2: Calling getDomain on the domain we registered "
echo
echo ---------------------------------------------------------
echo

near call $CONTRACT getDomain '{"domainName":"mnkhod"}' --accountId $CONTRACT

echo
echo
exit 0
