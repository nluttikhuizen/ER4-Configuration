# ER4-Configuration
Complete configuration of EdgeOS in combination with Wireguard / IPTV / KPN Internet.

EdgeOS CLI basics:
```bash
configure
commit
save
exit
```

Wireguard CLI basics:
```bash
#modify peers:
rm -r /opt/vyatta/config/active/interfaces/wireguard/wg0/peer/<client public key>/allowed-ips

# View connected clients
sudo wg
```