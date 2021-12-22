#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

echo
echo ---------------------------------------------------------
echo "Step 1: Build the contract (may take a few seconds)"
echo ---------------------------------------------------------
echo

yarn build

echo
echo
echo ---------------------------------------------------------
echo "Step 2: Deploy the contract"
echo ---------------------------------------------------------
echo

near deploy --accountId mnkhod.testnet --wasmFile ./build/debug/near-dns.wasm

echo ---------------------------------------------------------
echo ---------------------------------------------------------

exit 0
