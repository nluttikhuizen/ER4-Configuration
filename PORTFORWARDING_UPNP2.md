# Portforwarding configuration (really basic)
```bash
set port-forward auto-firewall enable
set port-forward hairpin-nat enable
set port-forward lan-interface eth1
set port-forward wan-interface pppoe0
```

# UPNP2 configuration for gaming on consoles
```bash
set service upnp2 acl rule 10 action allow
set service upnp2 acl rule 10 description 'Allow Console device to upnp2.'
set service upnp2 acl rule 10 external-port 0-65535
set service upnp2 acl rule 10 local-port 0-65535
set service upnp2 acl rule 10 subnet <IP device>/<PREFIX> #172.16.0.20/32 
set service upnp2 acl rule 20 action deny
set service upnp2 acl rule 20 description 'Deny all other devices'
set service upnp2 acl rule 20 external-port 0-65535
set service upnp2 acl rule 20 local-port 0-65535
set service upnp2 acl rule 20 subnet 0.0.0.0/0
set service upnp2 listen-on eth1
set service upnp2 nat-pmp disable
set service upnp2 port 5555
set service upnp2 secure-mode enable
set service upnp2 wan pppoe0
```