#!/bin/sh

sleep 10
killall -9 ss5
iptables -F

for ((i=1, j=1001; i <= 10 ; i++, j=j+1))
do
        /usr/sbin/useradd yyds$j -u $j -M -s /dev/null
done

cat /etc/passwd

iptables -t mangle -F OUTPUT
for ((i=1, j=1001; i <= 10 ; i++, j=j+1))
do
        iptables -t mangle -A OUTPUT -m owner --uid-owner $j -j MARK --set-mark $j
done

iptables -nvL -t mangle

iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -m mark --mark 1001 -j SNAT --to 10.0.0.4
iptables -t nat -A POSTROUTING -m mark --mark 1002 -j SNAT --to 10.0.0.11
iptables -t nat -A POSTROUTING -m mark --mark 1003 -j SNAT --to 10.0.0.12
iptables -t nat -A POSTROUTING -m mark --mark 1004 -j SNAT --to 10.0.0.13
iptables -t nat -A POSTROUTING -m mark --mark 1005 -j SNAT --to 10.0.0.14
iptables -t nat -A POSTROUTING -m mark --mark 1006 -j SNAT --to 10.0.0.15
iptables -t nat -A POSTROUTING -m mark --mark 1007 -j SNAT --to 10.0.0.16
iptables -t nat -A POSTROUTING -m mark --mark 1008 -j SNAT --to 10.0.0.17
iptables -t nat -A POSTROUTING -m mark --mark 1009 -j SNAT --to 10.0.0.18
iptables -t nat -A POSTROUTING -m mark --mark 1010 -j SNAT --to 10.0.0.19
iptables -nvL -t nat

cd  /etc/opt/ss5
sed -i '1i\auth             0.0.0.0/0       -       u' ss5.conf
sed -i '1a\permit u         0.0.0.0/0       -       0.0.0.0/0       -       -       -       -       -' ss5.conf

iptables -I INPUT 1 -m state --state NEW -m tcp -p tcp --dport 11222 -j ACCEPT
iptables -I INPUT 1 -m state --state NEW -m udp -p udp --dport 11222 -j ACCEPT


ip addr add 10.0.0.11/24 dev eth0 label eth0:0
ip addr add 10.0.0.12/24 dev eth0 label eth0:1
ip addr add 10.0.0.13/24 dev eth0 label eth0:2
ip addr add 10.0.0.14/24 dev eth0 label eth0:3
ip addr add 10.0.0.15/24 dev eth0 label eth0:4
ip addr add 10.0.0.16/24 dev eth0 label eth0:5
ip addr add 10.0.0.17/24 dev eth0 label eth0:6
ip addr add 10.0.0.18/24 dev eth0 label eth0:7
ip addr add 10.0.0.19/24 dev eth0 label eth0:8
#ip addr show

ss5 -u yyds1001 -t -m -b 10.0.0.4:11222
ss5 -u yyds1002 -t -m -b 10.0.0.11:11222
ss5 -u yyds1003 -t -m -b 10.0.0.12:11222
ss5 -u yyds1004 -t -m -b 10.0.0.13:11222
ss5 -u yyds1005 -t -m -b 10.0.0.14:11222
ss5 -u yyds1006 -t -m -b 10.0.0.15:11222
ss5 -u yyds1007 -t -m -b 10.0.0.16:11222
ss5 -u yyds1008 -t -m -b 10.0.0.17:11222
ss5 -u yyds1009 -t -m -b 10.0.0.18:11222
ss5 -u yyds1010 -t -m -b 10.0.0.19:11222
#ps -ef | grep ss5
