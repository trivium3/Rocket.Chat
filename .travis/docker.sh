#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CURL_URL="https://registry.hub.docker.com/u/rocketchat/rocket.chat/trigger/$PUSHTOKEN/"

if [[ -v "$TRAVIS_TAG" ]]; then
  CURL_DATA='{"source_type":"Tag","source_name":"'"$TRAVIS_TAG"'"}';
else
  CURL_DATA='{"docker_tag":"develop"}';
fi

curl -H "Content-Type: application/json" --data "$CURL_DATA" -X POST "$CURL_URL"
