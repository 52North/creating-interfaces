#!/bin/sh

# The file was copied and adapted from mdillon/postgis image's docker-entrypoint-initdb.d/postgis.sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Create the slupsktool user and slupsktool db
echo "Creating user and database slupsktool"
"${psql[@]}" <<- 'EOSQL'
CREATE USER slupsktool WITH ENCRYPTED PASSWORD '${SLUPSK_DB_PW}';
CREATE DATABASE slupsktool;
ALTER DATABASE slupsktool OWNER TO slupsktool;
EOSQL

# Load PostGIS into slupsktool
echo "Loading PostGIS extension into slupsktool"
	"${psql[@]}" --dbname="slupsktool" <<-'EOSQL'
		CREATE EXTENSION IF NOT EXISTS postgis;
EOSQL
