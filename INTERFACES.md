# Interface configuration
```bash
set interfaces ethernet eth0 description 'FTTH - ETH0'
set interfaces ethernet eth0 duplex auto
set interfaces ethernet eth0 firewall in ipv6-name WANv6_IN
set interfaces ethernet eth0 firewall in name WAN_IN
set interfaces ethernet eth0 firewall local ipv6-name WANv6_LOCAL
set interfaces ethernet eth0 firewall local name WAN_LOCAL
set interfaces ethernet eth0 firewall out name WAN_OUT
set interfaces ethernet eth0 mtu 1512
set interfaces ethernet eth0 speed auto
set interfaces ethernet eth1 address <IP Edgerouter>/<PREFIX>
set interfaces ethernet eth1 description 'ETH1 - LAN'
set interfaces ethernet eth1 duplex auto
set interfaces ethernet eth1 speed auto

#KPN
set interfaces ethernet eth0 vif 4 address dhcp
set interfaces ethernet eth0 vif 4 description 'FTTH - VLAN4 IPTV'
set interfaces ethernet eth0 vif 4 dhcp-options client-option 'send vendor-class-identifier &quot;IPTV_RG&quot;;'
set interfaces ethernet eth0 vif 4 dhcp-options client-option 'request subnet-mask, routers, rfc3442-classless-static-routes;'
set interfaces ethernet eth0 vif 4 dhcp-options default-route no-update
set interfaces ethernet eth0 vif 4 dhcp-options default-route-distance 210
set interfaces ethernet eth0 vif 4 dhcp-options name-server update
set interfaces ethernet eth0 vif 4 firewall in name WAN_IPTV_IN
set interfaces ethernet eth0 vif 4 firewall local name WAN_IPTV_LOCAL
set interfaces ethernet eth0 vif 4 mac '<MAC-ADDRESS from tv-box>'
set interfaces ethernet eth0 vif 6 description 'FTTH - VLAN6 Internet'
set interfaces ethernet eth0 vif 6 firewall in name WAN_IN
set interfaces ethernet eth0 vif 6 firewall local name WAN_LOCAL
set interfaces ethernet eth0 vif 6 firewall out name WAN_OUT
set interfaces ethernet eth0 vif 6 mac '<MAC-ADDRESS from KPN provided router(experia)>'
set interfaces ethernet eth0 vif 6 mtu 1508
set interfaces ethernet eth0 vif 6 pppoe 0 default-route auto
set interfaces ethernet eth0 vif 6 pppoe 0 description 'FTTH - PPPOE Internet'
set interfaces ethernet eth0 vif 6 pppoe 0 firewall in name WAN_IN
set interfaces ethernet eth0 vif 6 pppoe 0 firewall local name WAN_LOCAL
set interfaces ethernet eth0 vif 6 pppoe 0 firewall out name WAN_OUT
set interfaces ethernet eth0 vif 6 pppoe 0 idle-timeout 180
set interfaces ethernet eth0 vif 6 pppoe 0 mtu 1500
set interfaces ethernet eth0 vif 6 pppoe 0 name-server auto
set interfaces ethernet eth0 vif 6 pppoe 0 password kpn
set interfaces ethernet eth0 vif 6 pppoe 0 user-id <MAC-ADDRESS from KPN provided router(experia)>@internet

#creating VLAN interfaces: 
set interfaces ethernet eth1 vif 2 address <SUBNET>/<PREFIX>
set interfaces ethernet eth1 vif 2 description 'VLAN2 - IoT'
set interfaces ethernet eth1 vif 2 firewall in name PROTECT_IN_IOT
set interfaces ethernet eth1 vif 2 firewall local name PROTECT_LOCAL
set interfaces ethernet eth1 vif 3 address <SUBNET>/<PREFIX>
set interfaces ethernet eth1 vif 3 description 'VLAN3 - GUEST'
set interfaces ethernet eth1 vif 3 firewall in name PROTECT_IN_GUEST
set interfaces ethernet eth1 vif 3 firewall local name PROTECT_LOCAL
set interfaces ethernet eth1 vif 5 address <SUBNET>/<PREFIX>
set interfaces ethernet eth1 vif 5 description 'VLAN5 - CONTAINER UNTRUSTED'
set interfaces ethernet eth1 vif 5 firewall in name CONTAINER_UNTRUSTED_NETWORKS
set interfaces ethernet eth1 vif 5 firewall local name PROTECT_LOCAL
set interfaces ethernet eth1 vif 10 address <SUBNET>/<PREFIX>
set interfaces ethernet eth1 vif 10 description 'VLAN10 - CONTAINER TRUSTED'

#ETH2 is dedicated IPTV port
set interfaces ethernet eth2 address <SUBNET>/<PREFIX>
set interfaces ethernet eth2 description 'ETH2 - IPTV'
set interfaces ethernet eth2 duplex auto
set interfaces ethernet eth2 speed auto
set interfaces ethernet eth3 disable
set interfaces ethernet eth3 duplex auto
set interfaces ethernet eth3 mtu 1500
set interfaces ethernet eth3 speed auto
set interfaces loopback lo
```