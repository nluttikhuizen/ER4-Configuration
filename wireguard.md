# Wireguard VPN for EdgeOS.
### Links to binaries:
[[Vyatta] Wireguard releases for Edgerouter](https://github.com/WireGuard/wireguard-vyatta-ubnt/releases/)
## Installation
```bash
# Move to temp folder
cd /tmp

# Download binaries
curl -qLs https://github.com/WireGuard/wireguard-vyatta-ubnt/releases/download/1.0.20210219-5/e300-v2-v1.0.20210219-v1.0.20210315.deb -o wireguard.deb

# Install wireguard.deb
sudo dpkg -i wireguard.deb
```

## Wireguard private and public keys generation
```bash
# The command below will generate the keys: the first being your private key, and the second being your public key.
wg genkey | tee /dev/tty | wg pubkey
```

## Configure wireguard interface
```bash

# Configure the the Wireguard subnet and port
set interfaces wireguard wg0 description WIREGUARD-VPN
set interfaces wireguard wg0 address <SUBNET> #172.16.90.1/24 as example.
set interfaces wireguard wg0 listen-port <PORT> #80
set interfaces wireguard wg0 route-allowed-ips true
set interfaces wireguard wg0 private-key <PRIV KEY SRV> #from the wg genkey command above.

# Allow the client to connect, use <public key from client> as peer
#peer / client 1:
set interfaces wireguard wg0 peer <PUBLIC KEY ClIENT> allowed-ips <ClientIP> #172.16.90.2/32
set interfaces wireguard wg0 peer <PUBLIC KEY ClIENT>  persistent-keepalive 30

# Configure the firewall rule to allow access from WAN
set firewall name WAN_LOCAL rule 31 description "Allow external traffic to WIREGUARD"
set firewall name WAN_LOCAL rule 31 action accept
set firewall name WAN_LOCAL rule 31 protocol udp
set firewall name WAN_LOCAL rule 31 destination port <PORT>#80

# Let the DNS service listen on the WireGuard interface
set service dns forwarding listen-on wg0
```

### View connected clients
```bash 
sudo wg
```