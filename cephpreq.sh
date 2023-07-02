#Run on All nodes

#NTP Configuration -- Update NTP address according to your infra 

sed 's/^pool/#&/' -i /etc/chrony.conf
echo -e "pool 172.90.0.30  iburst \nallow 172.90.0.0/24 " >> /etc/chrony.conf
systemctl enable chronyd
systemctl restart chronyd


#Ceph installation

curl --silent --remote-name --location https://github.com/ceph/ceph/raw/quincy/src/cephadm/cephadm
 chmod +x cephadm
 ./cephadm add-repo --release quincy
 ./cephadm install
 ./cephadm install  ceph-common
