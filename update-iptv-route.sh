#!/bin/vbash

# Getting the current configured static route address
CUR_IP=$(cat /config/config.boot | grep 213.75.112.0/21 -A1 | grep next-hop | awk '{ print $2}');

# Getting the static route address from the network
NEW_IP=$(cat /var/run/dhclient_eth0.4_lease | grep new_routers | awk -F= '{print $2}' | tr -d \');

if [ "$CUR_IP" = "$NEW_IP" ]; then
   logger -s "Current IPTV next-hop route address "$CUR_IP" is VALID, no update needed."
   exit 1;
fi

logger -s "Current IPTV next-hop route address "$CUR_IP" is INVALID, updating to "$NEW_IP""

source /opt/vyatta/etc/functions/script-template

configure
delete protocols static route 213.75.112.0/21 next-hop $CUR_IP
set protocols static route 213.75.112.0/21 next-hop $NEW_IP
commit
save
exit

restart igmp-proxy