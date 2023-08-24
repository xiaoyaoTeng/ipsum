![Logo](https://i.imgur.com/PyKLAe7.png)

[![License](https://img.shields.io/badge/license-The_Unlicense-red.svg)](https://unlicense.org/)

About
----

**IPsum** is a threat intelligence feed based on 30+ different publicly available [lists](https://github.com/stamparm/maltrail) of suspicious and/or malicious IP addresses. All lists are automatically retrieved and parsed on a daily (24h) basis and the final result is pushed to this repository. List is made of IP addresses together with a total number of (black)list occurrence (for each). Greater the number, lesser the chance of false positive detection and/or dropping in (inbound) monitored traffic. Also, list is sorted from most (problematic) to least occurent IP addresses.

As an example, to get a fresh and ready-to-deploy auto-ban list of "bad IPs" that appear on at least 3 (black)lists you can run:

```
curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1
```

If you want to try it with `ipset`, you can do the following:

```
sudo su
apt-get -qq install iptables ipset
ipset -q flush ipsum
ipset -q create ipsum hash:ip
for ip in $(curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do ipset add ipsum $ip; done
iptables -D INPUT -m set --match-set ipsum src -j DROP 2>/dev/null
iptables -I INPUT -m set --match-set ipsum src -j DROP
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of Shame (2023-08-24)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
185.224.128.142|ihate.feds.kys|12
185.224.128.141|ihate.feds.kys|11
171.25.193.78|tor-exit-read-me.dfri.se|9
51.89.153.112|ns3145504.ip-51-89-153.eu|9
103.251.167.20|-|9
42.236.74.122|hn.kd.ny.adsl|9
185.224.128.187|-|9
185.129.62.62|tor01.zencurity.com|9
38.97.116.244|-|8
180.101.88.247|-|8
49.247.25.198|-|8
218.92.0.56|-|8
166.70.207.2|this.is.a.tor.node.xmission.com|8
167.94.138.50|scanner-07.ch1.censys-scanner.com|8
189.6.45.130|bd062d82.virtua.com.br|8
162.247.74.217|perry.fellwock.tor-exit.calyxinstitute.org|8
171.25.193.25|tor-exit-read-me.dfri.se|8
167.86.94.107|master-of-disaster.tor-exit.laarnes.nl|8
218.92.0.24|-|8
218.92.0.27|-|8
61.177.172.140|-|8
167.94.138.126|scanner-27.ch1.censys-scanner.com|8
43.163.219.169|-|8
218.92.0.118|-|8
183.230.229.65|-|8
41.216.47.138|adsl-41-216-47-138.intnet.bj|7
162.247.74.206|rosaluxemburg.tor-exit.calyxinstitute.org|7
89.234.157.254|marylou.nos-oignons.net|7
144.172.73.16|tor-exit4.riverside.rocks|7
165.227.85.21|officehuddle.com-main-site|7
218.92.0.34|-|7
218.92.0.31|-|7
119.4.250.94|-|7
45.95.146.59|hosted-by.alsycon.net|7
141.148.84.47|-|7
186.67.248.5|-|7
218.92.0.76|-|7
36.67.197.52|-|7
171.25.193.77|tor-exit-read-me.dfri.se|7
218.92.0.107|-|7
218.92.0.108|-|7
185.220.101.8|berlin01.tor-exit.artikel10.org|7
80.82.77.139|dojo.census.shodan.io|7
61.177.172.136|-|7
218.146.13.72|-|7
196.12.203.248|wana-248-203-12-196.wanamaroc.com|7
185.220.100.254|tor-exit-3.zbau.f3netze.de|7
189.7.17.61|bd07113d.virtua.com.br|7
211.253.10.96|-|7
185.100.87.174|torexit1.flokinet.net|7
185.220.101.55|tor-exit-55.for-privacy.net|7
185.130.44.108|tor-exit-se1.privex.cc|7
185.220.101.47|tor-exit-47.for-privacy.net|7
35.230.148.14|14.148.230.35.bc.googleusercontent.com|7
172.104.11.4|jersey.scan.bufferover.run|7
167.94.146.55|-|7
167.94.146.58|-|7
162.247.74.27|turing.tor-exit.calyxinstitute.org|7
93.174.95.106|battery.census.shodan.io|7
123.58.205.65|-|7
171.25.193.235|tor-exit-read-me.dfri.se|7
171.25.193.20|tor-exit-read-me.dfri.se|7
218.92.0.29|-|7
218.92.0.22|-|7
218.92.0.25|-|7
162.247.74.7|korematsu.tor-exit.calyxinstitute.org|7
167.248.133.188|scanner-29.ch1.censys-scanner.com|7
162.142.125.217|scanner-05.ch1.censys-scanner.com|7
185.241.208.204|-|7
221.213.129.46|-|7
71.6.135.131|soda.census.shodan.io|7
185.220.101.52|tor-exit-52.for-privacy.net|7
218.92.0.112|-|7
218.92.0.113|-|7
201.99.120.13|dsl-201-99-120-13-sta.prod-empresarial.com.mx|7
123.51.229.128|-|7
201.163.162.179|static-201-163-162-179.alestra.net.mx|7
167.94.145.53|-|7
165.227.228.72|-|7
1.235.198.19|-|7
60.174.192.240|-|7
167.248.133.127|scanner-26.ch1.censys-scanner.com|7
185.246.188.67|-|7
162.247.73.192|mario-louis-sylvester-lap.tor-exit.calyxinstitute.org|7
185.243.218.110|tor-exit1-terrahost06.tuxli.org|7
167.94.145.58|-|7
