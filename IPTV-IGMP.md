# IPTV and IGMP Proxy configuration
```bash
set protocols igmp-proxy interface eth0 role disabled
set protocols igmp-proxy interface eth0 threshold 1
set protocols igmp-proxy interface eth0.4 alt-subnet 213.75.0.0/16
set protocols igmp-proxy interface eth0.4 alt-subnet 217.166.0.0/16
set protocols igmp-proxy interface eth0.4 role upstream
set protocols igmp-proxy interface eth0.4 threshold 1
set protocols igmp-proxy interface eth0.4 whitelist 224.0.0.0/4
set protocols igmp-proxy interface eth0.34 role disabled
set protocols igmp-proxy interface eth0.34 threshold 1
set protocols igmp-proxy interface eth1 role disabled
set protocols igmp-proxy interface eth1 threshold 1
set protocols igmp-proxy interface eth1.2 role disabled
set protocols igmp-proxy interface eth1.2 threshold 1
set protocols igmp-proxy interface eth1.3 role disabled
set protocols igmp-proxy interface eth1.3 threshold 1
set protocols igmp-proxy interface eth1.4 role disabled
set protocols igmp-proxy interface eth1.4 threshold 1
set protocols igmp-proxy interface eth1.5 role disabled
set protocols igmp-proxy interface eth1.5 threshold 1
set protocols igmp-proxy interface eth1.6 role disabled
set protocols igmp-proxy interface eth1.6 threshold 1
set protocols igmp-proxy interface eth1.7 role disabled
set protocols igmp-proxy interface eth1.7 threshold 1
set protocols igmp-proxy interface eth1.8 role disabled
set protocols igmp-proxy interface eth1.8 threshold 1
set protocols igmp-proxy interface eth2 role downstream
set protocols igmp-proxy interface eth2 threshold 1
set protocols igmp-proxy interface eth3 role disabled
set protocols igmp-proxy interface eth3 threshold 1
set protocols igmp-proxy interface lo role disabled
set protocols igmp-proxy interface lo threshold 1
set protocols igmp-proxy interface wg0 role disabled
set protocols igmp-proxy interface wg0 threshold 1
set protocols static route 213.75.112.0/21 next-hop 10.200.24.1
```

# IPTV route
```bash
set system task-scheduler task update-IPTV-route executable path /config/scripts/post-config.d/update-iptv-route.sh
set system task-scheduler task update-IPTV-route interval 30m
```