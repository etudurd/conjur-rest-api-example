#!/bin/bash

# Script Purpose:
# - Set environment variables for Conjur authentication
# - Load variables dynamically before running the main script

# 🔹 Update these values with your Conjur details
export CONJUR_URL="https://replace-with-your-conjur-address"
export CONJUR_ACCOUNT="poc-conjur"
export CONJUR_HOST="host%2FAnsibleOSS%2FmyDemoApp" #replace with your host
export CONJUR_API_KEY="replace-with-your-host-api"
export SECRET_ID="AnsibleOSS/secretVar"  #replace with your secret 

# 🔹 Enable debug mode if needed
export DEBUG=true

echo "✅ Conjur environment variables set successfully."
echo "🔹 CONJUR_URL=$CONJUR_URL"
echo "🔹 CONJUR_ACCOUNT=$CONJUR_ACCOUNT"
echo "🔹 CONJUR_HOST=$CONJUR_HOST"
echo "🔹 SECRET_ID=$SECRET_ID"
echo "🔹 DEBUG=$DEBUG"

# If running in interactive mode, you can source this script:
# source ./set-conjur-env.sh
