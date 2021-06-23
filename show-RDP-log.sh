#!/bin/sh

# Example SEMP V1 script to show RDP log
#

source env.sh

if [ -z $HOST ] || [ -z $VPN ]
then
    echo "Enter Solace PubSub+ connection details in env.sh"
    exit
fi

curl -u $ADMIN_USER:$ADMIN_PASS $SEMP_URL/SEMP -w "\nHTTP return code: %{http_code}\n"\
 -d "<rpc><show><log><rest><rest-delivery-point/><errors/><wide/></rest></log></show></rpc>"


