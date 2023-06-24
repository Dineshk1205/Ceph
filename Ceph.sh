#Run on Ceph0 .Update Below Hostnames and IPs according to your infra 

cephadm bootstrap --mon-ip 172.90.0.30 --initial-dashboard-user "ceph-admin" --initial-dashboard-password "ADMIN_123" --dashboard-password-noupdate --cluster-network=172.91.0.0/24 --allow-fqdn-hostname


ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph1
ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph2


ceph orch host add ceph1.kdinesh.in 172.90.0.31
ceph orch host add ceph2.kdinesh.in 172.90.0.32


ceph orch apply mon --placement="ceph0.kdinesh.in,ceph1.kdinesh.in,ceph2.kdinesh.in"
ceph orch apply mgr --placement="ceph0.kdinesh.in,ceph1.kdinesh.in,ceph2.kdinesh.in"


ceph orch host label add ceph0.kdinesh.in osd-node
ceph orch host label add ceph1.kdinesh.in osd-node
ceph orch host label add ceph2.kdinesh.in osd-node


ceph orch host label add ceph0.kdinesh.in mon
ceph orch host label add ceph1.kdinesh.in mon
ceph orch host label add ceph2.kdinesh.in mon


ceph orch host label add ceph0.kdinesh.in mgr
ceph orch host label add ceph1.kdinesh.in mgr
ceph orch host label add ceph2.kdinesh.in mgr


ceph orch apply osd --all-available-devices
