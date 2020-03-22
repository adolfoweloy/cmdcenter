#!/bin/bash
PG_FILE=/usr/local/var/postgres

if [ -f $PG_FILE ]; then
	# postgres ccommands
	alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
	alias pglogs="tail -f /usr/local/var/postgres/server.log"
fi
