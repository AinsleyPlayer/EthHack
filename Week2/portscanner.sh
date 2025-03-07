#!/bin/bash


hostfile=$1
portfile=$2

# Validates if files do in fact exist

if [ ! -f "$hostfile" ]; then
 echo "ERROR: Host file '$hostfile' not found."
 exit 1

fi

if [ ! -f "$portfile" ]; then
 echo "ERROR: Host file '$portfile' not found."
 exit 1

fi

echo "host,port"
for host in $(cat $hostfile); do
 for port in $(cat $portfile); do
  timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
   echo "$host,$port"
 done
done
