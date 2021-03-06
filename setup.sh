#!/bin/bash

set -e

cd /manager/susemanager-utils/testing/docker/scripts/
# Move Postgres database to tmpfs to speed initialization and testing up
if [ ! -z $PG_TMPFS_DIR ]; then
    trap "umount $PG_TMPFS_DIR" EXIT INT TERM
    ./docker-testing-pgsql-move-data-to-tmpfs.sh $PG_TMPFS_DIR
fi

# Database schema creation
./reset_pgsql_database.sh

# SUSE Manager initialization
cp /root/rhn.conf /etc/rhn/rhn.conf
sysctl -w kernel.shmmax=18446744073709551615
smdba system-check autotuning

# Resolve libs and run tests
cd /manager/java
ant resolve-ivy

cp buildconf/test/rhn.conf.postgresql-example buildconf/test/rhn.conf
