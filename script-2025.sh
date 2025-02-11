#!/bin/bash

# Debugging output to check if environment variables are correctly loaded
echo "🔍 Debug Info:"
echo "CONJUR_URL=$CONJUR_URL"
echo "CONJUR_ACCOUNT=$CONJUR_ACCOUNT"
echo "CONJUR_HOST=$CONJUR_HOST"
echo "SECRET_ID=$SECRET_ID"
echo ""

# Print the authentication request for debugging
echo "🔹 Running Authentication Request:"
echo "curl -k -s --header 'Accept-Encoding: base64' --data '***API_KEY_HIDDEN***' '$CONJUR_URL/authn/$CONJUR_ACCOUNT/$CONJUR_HOST/authenticate'"

# Authenticate against Conjur and retrieve a token
token=$(curl -k -s --header "Accept-Encoding: base64" --data "$CONJUR_API_KEY" "$CONJUR_URL/authn/$CONJUR_ACCOUNT/$CONJUR_HOST/authenticate")

# Print the raw token for debugging
echo "🔑 Raw Token: $token"

# Check if token is empty
if [ -z "$token" ]; then
  echo "❌ Authentication failed. No token received."
  exit 1
fi

# Retrieve the secret
secret_value=$(curl -k -s --header "Authorization: Token token=\"$token\"" "$CONJUR_URL/secrets/$CONJUR_ACCOUNT/variable/$SECRET_ID")

echo " "
echo "---- Retrieving Secret Value -----------"
echo "ID: $SECRET_ID"
echo "Value: $secret_value"
echo "----------------------------------------"
echo " "
