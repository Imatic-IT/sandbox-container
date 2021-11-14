#!/bin/bash
function addAuthorizedKey { #{{{
local user="${1?user}"
local key="${2?key}"

#Create user if not exists
getent passwd $user >/dev/null || useradd -m $user -s /bin/bash

local userHome=$(eval echo ~${user})
local AK=${userHome}/.ssh/authorized_keys

mkdir -p --mode=0700 ${userHome}/.ssh
echo "$key" > "$AK"

chown -R $user:$user ${userHome}/.ssh
chmod 0600 "$AK"
echo $AK
echo $KEY
echo $AUTHORIZED_KEY_ROOT
} #}}}
. /.env
addAuthorizedKey root "$AUTHORIZED_KEY_ROOT"
/etc/init.d/ssh start
trap : TERM INT; 
sleep infinity &
wait
