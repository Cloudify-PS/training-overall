#!/bin/bash
set -e

TEMP_DIR="/tmp"
PYTHON_FILE_SERVER_ROOT=${TEMP_DIR}/python-simple-http-webserver

ctx logger info "Deleting file server root directory (${PYTHON_FILE_SERVER_ROOT})"
rm -rf ${PYTHON_FILE_SERVER_ROOT}