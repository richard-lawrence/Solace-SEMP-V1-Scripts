#!/bin/sh
#
# Example SEMP V1 to release activity and force and HA failover 
#
source env.sh

if [ -z $HOST ] || [ -z $VPN ]
then
    echo "Enter Solace PubSub+ connection details in env.sh"
    exit
fi

curl -u $ADMIN_USER:$ADMIN_PASS $SEMP_URL/SEMP  -w "\nHTTP return code: %{http_code}\n" \
-d "<rpc><redundancy><release-activity/></redundancy></rpc>"

curl -u $ADMIN_USER:$ADMIN_PASS $SEMP_URL/SEMP  -w "\nHTTP return code: %{http_code}\n" \
-d "<rpc><redundancy><no><release-activity/></no></redundancy></rpc>"

