#!/bin/bash

set -e
TEMP_DIR="/tmp"
PYTHON_FILE_SERVER_ROOT=${TEMP_DIR}/python-simple-http-webserver
ctx logger info "configure python server from ${PYTHON_FILE_SERVER_ROOT}"
cd ${PYTHON_FILE_SERVER_ROOT}/app
echo "export DB_HOST=$1" >> env_set.sh
echo "export DB_PORT=$2" >> env_set.sh
echo "export DB_USERNAME=$3" >> env_set.sh
echo "export DB_PASSWORD=$4" >> env_set.sh

sudo pip install -r requirements.txt