# DNS configuration

```bash
set system name-server 127.0.0.1
set service dns forwarding cache-size 150
set service dns forwarding listen-on eth1
set service dns forwarding listen-on wg0
set service dns forwarding name-server 8.8.4.4
set service dns forwarding name-server 1.1.1.1
set service dns forwarding name-server 1.0.0.1
set service dns forwarding name-server 8.8.8.8
set service dns forwarding options no-negcache

# domain name for LAN.
set system domain-name home.lan

```