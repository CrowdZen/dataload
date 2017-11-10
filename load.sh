#!/bin/bash -ev

export PGHOST=localhost
export PGPORT=15432
export PGUSER=postgres
export PGPASSWORD=example
dropdb --if-exists crowdzen
createdb crowdzen

psql -f create.sql crowdzen


cat dininghalls/bplate-2016-2017.csv | sed 's/$/,'bplate'/' | psql crowdzen -c "COPY dining(time_ts,activity_level,location) FROM stdin DELIMITERS ',' CSV;"
cat dininghalls/covel-2016-2017.csv | sed 's/$/,'covel'/' | psql crowdzen -c "COPY dining(time_ts,activity_level,location) FROM stdin DELIMITERS ',' CSV;"
cat dininghalls/feast-2016-2017.csv |sed 's/$/,'feast'/' | psql crowdzen -c "COPY dining(time_ts,activity_level,location) FROM stdin DELIMITERS ',' CSV;"
cat dininghalls/nev-2016-2017.csv | sed 's/$/,'nev'/' | psql crowdzen -c "COPY dining(time_ts,activity_level,location) FROM stdin DELIMITERS ',' CSV;"
cat dininghalls/rendezvous-2016-2017.csv | sed 's/$/,'rend'/' | psql crowdzen -c "COPY dining(time_ts,activity_level,location) FROM stdin DELIMITERS ',' CSV;"



