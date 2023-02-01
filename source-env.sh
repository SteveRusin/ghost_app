#! /bin/bash

if [ -f .env ]
then
  set -o allexport
  source ./.env
  set +o allexport
  echo "Env variables has been exported";
fi
