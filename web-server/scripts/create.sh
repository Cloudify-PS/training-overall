#!/bin/bash
set -e
sudo apt-get -y update
sudo apt-get -y install unzip python-pip python-psycopg2 libpq-dev python-dev libxml2-dev libxslt-dev libffi-dev

TEMP_DIR="/tmp"
PYTHON_FILE_SERVER_ROOT=${TEMP_DIR}/python-simple-http-webserver
if [ -d ${PYTHON_FILE_SERVER_ROOT} ]; then
	echo "Removing file server root folder ${PYTHON_FILE_SERVER_ROOT}"
	rm -rf ${PYTHON_FILE_SERVER_ROOT}
fi
ctx logger info "Creating python server root directory at ${PYTHON_FILE_SERVER_ROOT}"

mkdir -p ${PYTHON_FILE_SERVER_ROOT}

cd ${PYTHON_FILE_SERVER_ROOT}

resource_path="resources/app.zip"

ctx logger info "Downloading blueprint resources..."
ctx download-resource ${resource_path} ${PYTHON_FILE_SERVER_ROOT}/app.zip
unzip app.zip -d app
