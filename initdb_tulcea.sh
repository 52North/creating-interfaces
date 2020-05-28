#!/bin/sh

# The file was copied and adapted from mdillon/postgis image's docker-entrypoint-initdb.d/postgis.sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Create the tulceatool user and tulceatool db
echo "Creating user and database tulceatool"
"${psql[@]}" <<- 'EOSQL'
CREATE USER tulceatool WITH ENCRYPTED PASSWORD '${TULCEA_DB_PW}';
CREATE DATABASE tulceatool;
ALTER DATABASE tulceatool OWNER TO tulceatool;
EOSQL

# Load PostGIS into tulceatool
echo "Loading PostGIS extension into tulceatool"
	"${psql[@]}" --dbname="tulceatool" <<-'EOSQL'
		CREATE EXTENSION IF NOT EXISTS postgis;
EOSQL
