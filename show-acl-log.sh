#!/bin/sh
#
# Script to print ACL log
#
source env.sh

if [ -z $HOST ] || [ -z $VPN ]
then
    echo "Enter Solace PubSub+ connection details in env.sh"
    exit
fi

    curl -u $ADMIN_USER:$ADMIN_PASS $SEMP_URL/SEMP  -w "\nHTTP return code: %{http_code}\n" \
-d "<rpc><show><log><acl></acl></log></show></rpc>"


