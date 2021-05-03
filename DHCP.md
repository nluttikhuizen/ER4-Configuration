# DHCP configuration
```bash
set service dhcp-server disabled false
set service dhcp-server hostfile-update disable
set service dhcp-server shared-network-name DOCKER authoritative disable
set service dhcp-server shared-network-name DOCKER subnet <SUBNET>/<PREFIX> default-router <GATEWAYIP> #VLAN Router IP
set service dhcp-server shared-network-name DOCKER subnet <SUBNET>/<PREFIX> dns-server 8.8.8.8
set service dhcp-server shared-network-name DOCKER subnet <SUBNET>/<PREFIX> dns-server 8.8.4.4
set service dhcp-server shared-network-name DOCKER subnet <SUBNET>/<PREFIX> lease 3600
set service dhcp-server shared-network-name DOCKER subnet <SUBNET>/<PREFIX> start <STARTRANGE> stop <ENDRANGE>
set service dhcp-server shared-network-name GUEST authoritative disable
set service dhcp-server shared-network-name GUEST subnet <SUBNET>/<PREFIX>default-router <GATEWAYIP> #VLAN Router IP
set service dhcp-server shared-network-name GUEST subnet <SUBNET>/<PREFIX>dns-server 8.8.8.8
set service dhcp-server shared-network-name GUEST subnet <SUBNET>/<PREFIX>dns-server 8.8.4.4
set service dhcp-server shared-network-name GUEST subnet <SUBNET>/<PREFIX>domain-name guest.lan
set service dhcp-server shared-network-name GUEST subnet <SUBNET>/<PREFIX>lease 3600
set service dhcp-server shared-network-name GUEST subnet <SUBNET>/<PREFIX>start <STARTRANGE> stop <ENDRANGE>
set service dhcp-server shared-network-name IOT authoritative disable
set service dhcp-server shared-network-name IOT subnet <SUBNET>/<PREFIX> default-router <GATEWAYIP> #VLAN Router IP
set service dhcp-server shared-network-name IOT subnet <SUBNET>/<PREFIX> dns-server 8.8.8.8
set service dhcp-server shared-network-name IOT subnet <SUBNET>/<PREFIX> dns-server 8.8.4.4
set service dhcp-server shared-network-name IOT subnet <SUBNET>/<PREFIX> domain-name iot.lan
set service dhcp-server shared-network-name IOT subnet <SUBNET>/<PREFIX> lease 3600
set service dhcp-server shared-network-name IOT subnet <SUBNET>/<PREFIX> start <STARTRANGE> stop <ENDRANGE>
set service dhcp-server shared-network-name IPTV authoritative disable
set service dhcp-server shared-network-name IPTV subnet <SUBNET>/<PREFIX> default-router <GATEWAYIP> #VLAN Router IP
set service dhcp-server shared-network-name IPTV subnet <SUBNET>/<PREFIX> dns-server 1.1.1.1
set service dhcp-server shared-network-name IPTV subnet <SUBNET>/<PREFIX> dns-server 1.0.0.1
set service dhcp-server shared-network-name IPTV subnet <SUBNET>/<PREFIX> domain-name iptv.lan
set service dhcp-server shared-network-name IPTV subnet <SUBNET>/<PREFIX> lease 28800
set service dhcp-server shared-network-name IPTV subnet <SUBNET>/<PREFIX> start <STARTRANGE> stop <ENDRANGE>
set service dhcp-server shared-network-name LAN authoritative disable
set service dhcp-server shared-network-name LAN subnet <SUBNET>/<PREFIX> default-router <RouterIP>
set service dhcp-server shared-network-name LAN subnet <SUBNET>/<PREFIX> dns-server <RouterIP>
set service dhcp-server shared-network-name LAN subnet <SUBNET>/<PREFIX> domain-name home.lan
set service dhcp-server shared-network-name LAN subnet <SUBNET>/<PREFIX> lease 28800
set service dhcp-server shared-network-name LAN subnet <SUBNET>/<PREFIX> start <STARTRANGE> stop <ENDRANGE>
set service dhcp-server static-arp disable
set service dhcp-server use-dnsmasq disable
```