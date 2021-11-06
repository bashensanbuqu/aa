#!/bin/sh
if [ $(whoami) != "root" ];then
	echo "请使用root权限运行此一键安装命令！"
        echo "切换到root用户：sudo su root"
	exit 1;
fi
xs=$(ps -ef | grep ss5)
k=$(killall -9 ss5)
ip=$(ip addr | grep -E -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -E -v "^127\.|^255\.|^0\." | head -n 1)
a=10.0.0.4
b=10.0.0.5
c=10.0.0.6

if [ $ip == $a ];then
echo $k
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

echo "$xs"

elif [ $ip == $b ];then
echo $k
ss5 -u yyds1001 -t -m -b 10.0.0.5:11222
ss5 -u yyds1002 -t -m -b 10.0.0.11:11222
ss5 -u yyds1003 -t -m -b 10.0.0.12:11222
ss5 -u yyds1004 -t -m -b 10.0.0.13:11222
ss5 -u yyds1005 -t -m -b 10.0.0.14:11222
ss5 -u yyds1006 -t -m -b 10.0.0.15:11222
ss5 -u yyds1007 -t -m -b 10.0.0.16:11222
ss5 -u yyds1008 -t -m -b 10.0.0.17:11222
ss5 -u yyds1009 -t -m -b 10.0.0.18:11222
ss5 -u yyds1010 -t -m -b 10.0.0.19:11222

echo "$xs"

elif [ $ip == $c ];then
echo $k
ss5 -u yyds1001 -t -m -b 10.0.0.6:11222
ss5 -u yyds1002 -t -m -b 10.0.0.11:11222
ss5 -u yyds1003 -t -m -b 10.0.0.12:11222
ss5 -u yyds1004 -t -m -b 10.0.0.13:11222
ss5 -u yyds1005 -t -m -b 10.0.0.14:11222
ss5 -u yyds1006 -t -m -b 10.0.0.15:11222
ss5 -u yyds1007 -t -m -b 10.0.0.16:11222
ss5 -u yyds1008 -t -m -b 10.0.0.17:11222
ss5 -u yyds1009 -t -m -b 10.0.0.18:11222
ss5 -u yyds1010 -t -m -b 10.0.0.19:11222

echo "$xs"

else
echo "未找到匹配的IP地址"
echo " "
echo "专用ip地址为:"
echo "$a,$b,$c"
fi
