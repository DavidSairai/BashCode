#!/bin/bash -xe
echo "Started..."
pwd

sed -i 's|PermitRootLogin without-password|PermitRootLogin yes|' /etc/ssh/sshd_config
sed -i 's|PasswordAuthentication no|PasswordAuthentication yes|' /etc/ssh/sshd_config

echo 'root:cupoftea' | chpasswd
service sshd reload

#install deps
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O jq
chmod +x ./jq
cp ./jq /usr/bin
echo "Installed jq..."

## assign IP addresses
macaddress=$(curl http://169.254.169.254/latest/meta-data/mac)
interfaceId=$(curl "http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macaddress/interface-id")
region=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq .region -r)

aws ec2 assign-private-ip-addresses --allow-reassignment --region $region --network-interface-id $interfaceId --secondary-private-ip-address-count 9

privateIpAddresses=$(aws ec2 describe-network-interfaces --region $region --network-interface-ids $interfaceId | jq '.NetworkInterfaces' | jq '.[]' | ./jq '.PrivateIpAddresses' | jq 'map(select(.Primary != true))' | jq '.[]' | jq '.PrivateIpAddress')

i=0
for value in $privateIpAddresses
do
echo $value
echo $i
cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0:$i
  DEVICE=eth0:$i
  BOOTPROTO=none
  IPADDR=$value
  ONBOOT=yes
  NETMASK=255.255.255.255
EOF
i=$(($i + 1))
done

/etc/init.d/network restart