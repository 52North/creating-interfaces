#!/bin/bash -e

. venv/bin/activate && ./deploy.sh 0.0.1 && python3 ./db/manage.py migrate

exec "$@"
