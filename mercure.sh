#!/bin/bash
env=$(cat .env.local | grep ENV | cut -d '=' -f2)
if [ $env == "PROD" ] ; then caddyfile="Caddyfile"
else
  caddyfile='Caddyfile.dev'
fi

publisher_jwt=$(cat .env.local | grep MERCURE_PUBLISHER_JWT_KEY | cut -d '=' -f2)
subscriber_jwt=$(cat .env.local | grep MERCURE_SUBSCRIBER_JWT_KEY | cut -d '=' -f2)

SERVER_NAME=:3000 \
MERCURE_PUBLISHER_JWT_KEY=$publisher_jwt \
MERCURE_SUBSCRIBER_JWT_KEY=$subscriber_jwt \
./mercure run -config $caddyfile