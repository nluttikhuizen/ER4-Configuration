# Firewall configuration
```bash
set firewall all-ping enable
set firewall broadcast-ping disable

#Creating firewall groups:
set firewall group network-group CONTAINER_UNTRUSTED_NETWORKS description "Untrusted container firewall group"
set firewall group network-group CONTAINER_UNTRUSTED_NETWORKS network <SUBNET>/<PREFIX>
set firewall group network-group GUEST_NETWORKS description 'Guest Network group'
set firewall group network-group GUEST_NETWORKS network <SUBNET>/<PREFIX>
set firewall group network-group IOT_NETWORKS description 'IoT Network group'
set firewall group network-group IOT_NETWORKS network <SUBNET>/<PREFIX> 
set firewall group network-group IPTV_NETWORKS description 'IPTV Network group'
set firewall group network-group IPTV_NETWORKS network <SUBNET>/<PREFIX> 
set firewall group network-group LAN_NETWORKS description 'LAN Network group'
set firewall group network-group LAN_NETWORKS network <SUBNET>/<PREFIX> 
set firewall group network-group LAN_NETWORKS network <SUBNET>/<PREFIX> #added wireguard subnet <SUBNET>/<PREFIX>

# Firewall rules for VLAN's.
set firewall name PROTECT_IN_DOCKER default-action accept
set firewall name PROTECT_IN_DOCKER rule 10 action accept
set firewall name PROTECT_IN_DOCKER rule 10 description 'Accept Established/Related'
set firewall name PROTECT_IN_DOCKER rule 10 protocol all
set firewall name PROTECT_IN_DOCKER rule 10 state established enable
set firewall name PROTECT_IN_DOCKER rule 10 state related enable
set firewall name PROTECT_IN_DOCKER rule 20 action drop
set firewall name PROTECT_IN_DOCKER rule 20 description 'Drop ALL traffic to LAN_NETWORKS'
set firewall name PROTECT_IN_DOCKER rule 20 destination group network-group LAN_NETWORKS
set firewall name PROTECT_IN_DOCKER rule 20 protocol all
set firewall name PROTECT_IN_DOCKER rule 22 action drop
set firewall name PROTECT_IN_DOCKER rule 22 description 'Drop ALL traffic to GUEST_NETWORKS'
set firewall name PROTECT_IN_DOCKER rule 22 destination group network-group GUEST_NETWORKS
set firewall name PROTECT_IN_DOCKER rule 22 protocol all
set firewall name PROTECT_IN_DOCKER rule 23 action drop
set firewall name PROTECT_IN_DOCKER rule 23 description 'Drop ALL traffic to IOT_NETWORKS'
set firewall name PROTECT_IN_DOCKER rule 23 destination group network-group IOT_NETWORKS
set firewall name PROTECT_IN_DOCKER rule 23 protocol all

set firewall name PROTECT_IN_GUEST default-action accept
set firewall name PROTECT_IN_GUEST rule 10 action accept
set firewall name PROTECT_IN_GUEST rule 10 description 'Accept Established/Related'
set firewall name PROTECT_IN_GUEST rule 10 protocol all
set firewall name PROTECT_IN_GUEST rule 10 state established enable
set firewall name PROTECT_IN_GUEST rule 10 state related enable
set firewall name PROTECT_IN_GUEST rule 20 action drop
set firewall name PROTECT_IN_GUEST rule 20 description 'Drop ALL traffic to LAN_NETWORKS'
set firewall name PROTECT_IN_GUEST rule 20 destination group network-group LAN_NETWORKS
set firewall name PROTECT_IN_GUEST rule 20 protocol all
set firewall name PROTECT_IN_GUEST rule 22 action drop
set firewall name PROTECT_IN_GUEST rule 22 description 'Drop ALL traffic to IOT_NETWORKS'
set firewall name PROTECT_IN_GUEST rule 22 destination group network-group IOT_NETWORKS
set firewall name PROTECT_IN_GUEST rule 22 protocol all
set firewall name PROTECT_IN_GUEST rule 25 action drop
set firewall name PROTECT_IN_GUEST rule 25 description 'Drop ALL traffic to CONTAINER_UNTRUSTED_NETWORKS'
set firewall name PROTECT_IN_GUEST rule 25 destination group network-group CONTAINER_UNTRUSTED_NETWORKS
set firewall name PROTECT_IN_GUEST rule 25 protocol all

set firewall name PROTECT_IN_IOT default-action accept
set firewall name PROTECT_IN_IOT rule 10 action accept
set firewall name PROTECT_IN_IOT rule 10 description 'Accept Established/Related'
set firewall name PROTECT_IN_IOT rule 10 protocol all
set firewall name PROTECT_IN_IOT rule 10 state established enable
set firewall name PROTECT_IN_IOT rule 10 state related enable
set firewall name PROTECT_IN_IOT rule 20 action drop
set firewall name PROTECT_IN_IOT rule 20 description 'Drop ALL traffic to LAN_NETWORKS'
set firewall name PROTECT_IN_IOT rule 20 destination group network-group LAN_NETWORKS
set firewall name PROTECT_IN_IOT rule 20 protocol all
set firewall name PROTECT_IN_IOT rule 22 action drop
set firewall name PROTECT_IN_IOT rule 22 description 'Drop ALL traffic to GUEST_NETWORKS'
set firewall name PROTECT_IN_IOT rule 22 destination group network-group GUEST_NETWORKS
set firewall name PROTECT_IN_IOT rule 22 protocol all
set firewall name PROTECT_IN_IOT rule 25 action drop
set firewall name PROTECT_IN_IOT rule 25 description 'Drop ALL traffic to CONTAINER_UNTRUSTED_NETWORKS'
set firewall name PROTECT_IN_IOT rule 25 destination group network-group CONTAINER_UNTRUSTED_NETWORKS
set firewall name PROTECT_IN_IOT rule 25 protocol all

#Firewall rule WAN_IN (ipv6)
set firewall ipv6-name WANv6_IN default-action drop
set firewall ipv6-name WANv6_IN description 'WAN inbound traffic forwarded to LAN'
set firewall ipv6-name WANv6_IN enable-default-log
set firewall ipv6-name WANv6_IN rule 10 action accept
set firewall ipv6-name WANv6_IN rule 10 description 'Allow established/related sessions'
set firewall ipv6-name WANv6_IN rule 10 state established enable
set firewall ipv6-name WANv6_IN rule 10 state related enable
set firewall ipv6-name WANv6_IN rule 20 action drop
set firewall ipv6-name WANv6_IN rule 20 description 'Drop invalid state'
set firewall ipv6-name WANv6_IN rule 20 state invalid enable
set firewall ipv6-name WANv6_LOCAL default-action drop
set firewall ipv6-name WANv6_LOCAL description 'WAN inbound traffic to the router'
set firewall ipv6-name WANv6_LOCAL enable-default-log
set firewall ipv6-name WANv6_LOCAL rule 10 action accept
set firewall ipv6-name WANv6_LOCAL rule 10 description 'Allow established/related sessions'
set firewall ipv6-name WANv6_LOCAL rule 10 state established enable
set firewall ipv6-name WANv6_LOCAL rule 10 state related enable
set firewall ipv6-name WANv6_LOCAL rule 20 action drop
set firewall ipv6-name WANv6_LOCAL rule 20 description 'Drop invalid state'
set firewall ipv6-name WANv6_LOCAL rule 20 state invalid enable
set firewall ipv6-name WANv6_LOCAL rule 30 action accept
set firewall ipv6-name WANv6_LOCAL rule 30 description 'Allow IPv6 icmp'
set firewall ipv6-name WANv6_LOCAL rule 30 protocol ipv6-icmp
set firewall ipv6-name WANv6_LOCAL rule 40 action accept
set firewall ipv6-name WANv6_LOCAL rule 40 description 'allow dhcpv6'
set firewall ipv6-name WANv6_LOCAL rule 40 destination port 546
set firewall ipv6-name WANv6_LOCAL rule 40 protocol udp
set firewall ipv6-name WANv6_LOCAL rule 40 source port 547
set firewall ipv6-receive-redirects disable
set firewall ipv6-src-route disable
set firewall ip-src-route disable
set firewall log-martians enable

## Local firewall rule between VLAN's.
set firewall name PROTECT_LOCAL default-action drop
set firewall name PROTECT_LOCAL rule 10 action accept
set firewall name PROTECT_LOCAL rule 10 description 'Allow DHCP traffic for additional vlans (vlan 2, 3 and 4) - Needed if dnsmasq is enabled.'
set firewall name PROTECT_LOCAL rule 10 destination port 67,68
set firewall name PROTECT_LOCAL rule 10 protocol udp
set firewall name PROTECT_LOCAL rule 11 action accept
set firewall name PROTECT_LOCAL rule 11 description UPnP2
set firewall name PROTECT_LOCAL rule 11 destination port 1900
set firewall name PROTECT_LOCAL rule 11 protocol udp
set firewall name PROTECT_LOCAL rule 12 action accept
set firewall name PROTECT_LOCAL rule 12 description 'allow miniupnpd port'
set firewall name PROTECT_LOCAL rule 12 destination port 5555
set firewall name PROTECT_LOCAL rule 12 protocol tcp
set firewall name PROTECT_LOCAL rule 20 action accept
set firewall name PROTECT_LOCAL rule 20 description 'Allow NTP traffic from additional networks.'
set firewall name PROTECT_LOCAL rule 20 destination port ntp
set firewall name PROTECT_LOCAL rule 20 log disable
set firewall name PROTECT_LOCAL rule 20 protocol tcp_udp

## Firewall rule WAN-IN (ipv4)
set firewall name WAN_IN default-action drop
set firewall name WAN_IN description 'WAN to internal'
set firewall name WAN_IN rule 10 action accept
set firewall name WAN_IN rule 10 description 'Allow established/related'
set firewall name WAN_IN rule 10 state established enable
set firewall name WAN_IN rule 10 state related enable
set firewall name WAN_IN rule 20 action drop
set firewall name WAN_IN rule 20 description 'Drop invalid state'
set firewall name WAN_IN rule 20 state invalid enable

## IPTV Firewall KPN:
set firewall name WAN_IPTV_IN default-action drop
set firewall name WAN_IPTV_IN description 'IPTV to internal'
set firewall name WAN_IPTV_IN enable-default-log
set firewall name WAN_IPTV_IN rule 10 action accept
set firewall name WAN_IPTV_IN rule 10 description 'Allow Established/Related'
set firewall name WAN_IPTV_IN rule 10 log disable
set firewall name WAN_IPTV_IN rule 10 state established enable
set firewall name WAN_IPTV_IN rule 10 state related enable
set firewall name WAN_IPTV_IN rule 20 action accept
set firewall name WAN_IPTV_IN rule 20 description 'Allow UDP to Multicast'
set firewall name WAN_IPTV_IN rule 20 destination address 224.0.0.0/4
set firewall name WAN_IPTV_IN rule 20 log disable
set firewall name WAN_IPTV_IN rule 20 protocol udp
set firewall name WAN_IPTV_IN rule 20 state new enable
set firewall name WAN_IPTV_IN rule 40 action drop
set firewall name WAN_IPTV_IN rule 40 description 'Drop invalid state'
set firewall name WAN_IPTV_IN rule 40 log disable
set firewall name WAN_IPTV_IN rule 40 state invalid enable

set firewall name WAN_IPTV_LOCAL default-action drop
set firewall name WAN_IPTV_LOCAL description 'IPTV to router'
set firewall name WAN_IPTV_LOCAL enable-default-log
set firewall name WAN_IPTV_LOCAL rule 10 action accept
set firewall name WAN_IPTV_LOCAL rule 10 description 'Allow Multicast'
set firewall name WAN_IPTV_LOCAL rule 10 destination address 224.0.0.0/4
set firewall name WAN_IPTV_LOCAL rule 10 log disable
set firewall name WAN_IPTV_LOCAL rule 20 action accept
set firewall name WAN_IPTV_LOCAL rule 20 description 'Allow Established/Related'
set firewall name WAN_IPTV_LOCAL rule 20 log disable
set firewall name WAN_IPTV_LOCAL rule 20 state established enable
set firewall name WAN_IPTV_LOCAL rule 20 state related enable
set firewall name WAN_IPTV_LOCAL rule 30 action drop
set firewall name WAN_IPTV_LOCAL rule 30 description 'Drop invalid state'
set firewall name WAN_IPTV_LOCAL rule 30 log disable
set firewall name WAN_IPTV_LOCAL rule 30 protocol all
set firewall name WAN_IPTV_LOCAL rule 30 state established disable
set firewall name WAN_IPTV_LOCAL rule 30 state invalid enable
set firewall name WAN_IPTV_LOCAL rule 30 state new disable
set firewall name WAN_IPTV_LOCAL rule 30 state related disable

# Firewall Rule WAN_LOCAL (Firewall from Internet to Router, no interfaces..)
set firewall name WAN_LOCAL default-action drop
set firewall name WAN_LOCAL description 'WAN to router'
set firewall name WAN_LOCAL rule 10 action accept
set firewall name WAN_LOCAL rule 10 description 'Allow established/related'
set firewall name WAN_LOCAL rule 10 state established enable
set firewall name WAN_LOCAL rule 10 state related enable
set firewall name WAN_LOCAL rule 20 action drop
set firewall name WAN_LOCAL rule 20 description 'Drop invalid state'
set firewall name WAN_LOCAL rule 20 state invalid enable
set firewall name WAN_LOCAL rule 31 action accept
set firewall name WAN_LOCAL rule 31 description 'Allow external traffic to WIREGUARD'
set firewall name WAN_LOCAL rule 31 destination port 80
set firewall name WAN_LOCAL rule 31 protocol udp

# Firewall rule to block devices on MAC from LAN to Internet.
set firewall name WAN_OUT default-action accept
set firewall name WAN_OUT description 'Firewall rule to control outgoing traffic'
set firewall name WAN_OUT rule 10 action drop
set firewall name WAN_OUT rule 10 description 'Reject ALL traffic from IP CAM'
set firewall name WAN_OUT rule 10 protocol all
set firewall name WAN_OUT rule 10 source mac-address '<MAC:ADDRESS>'

set firewall receive-redirects disable
set firewall send-redirects enable
set firewall source-validation disable
set firewall syn-cookies enable
```