#inside docker

psql -h 172.17.0.1 -p 15432 -U postgres crowdzen

#from host

psql -h localhost -p 15432 -U postgres crowdzen
