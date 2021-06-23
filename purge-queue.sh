#!/bin/sh
#
# Sample SEMP V1 script to purge all messages on given queue.
# Warning: all messages will be destroyed, use at user's own risk.
#

source env.sh

if [ -z $HOST ] || [ -z $VPN ]
then
    echo "Enter Solace PubSub+ connection details in env.sh"
    exit
fi
 
QUEUE=$1

if [ -z $QUEUE ]
then
    echo "Enter queue name"
    exit
fi
 

echo "Purge all messages on queue \"$QUEUE\" for service \"$VPN\" (y/n)?\nWarning all messages will be destroyed!"
read answer

if [ "$answer" == "Y" -o "$answer" == "y" ] ;then

    curl -u $ADMIN_USER:$ADMIN_PASS $SEMP_URL/SEMP -w "\nHTTP return code: %{http_code}\n"\
    -d "<rpc><admin><message-spool><vpn-name>$VPN</vpn-name><delete-messages><queue-name>$QUEUE</queue-name></delete-messages></message-spool></admin></rpc>"

else
    echo Not done
fi

