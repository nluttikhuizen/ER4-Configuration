#!/bin/bash
countryList="nl"
firewallGroupName=COUNTRIES-ALLOWED_FIREWALL

mkdir -p /config/zonefiles
function loadcountry () {
        firewallGroupName=$1
        country=$2

        logger -s "Downloading country definition for $country..."
        curl http://www.ipdeny.com/ipblocks/data/countries/${country}.zone -o /config/zonefiles/${country}.zone -s
		logger -s "Adding rules for $country to firewall group $firewallGroupName..."
        for rule in `cat /config/zonefiles/${country}.zone`; do
                ipset add $firewallGroupName $rule
        done
}

ipset -F $firewallGroupName
for country in $countryList; do
        loadcountry $firewallGroupName $country
done