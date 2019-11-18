[Unit]
Description=Etcd Server
After=network.target
After=network-online.target
Wants=network-online.target
Documentation=https://github.com/coreos

[Service]
Type=notify
WorkingDirectory={{ ETCD_DATA_DIR }}
ExecStart={{ K8S_BASE_DIR }}/bin/etcd \
  --data-dir={{ ETCD_DATA_DIR }} \
  --wal-dir={{ ETCD_WAL_DIR }} \
  --name={{ NODE_NAME }} \
  --cert-file={{ K8S_BASE_DIR }}/cert/etcd.pem \
  --key-file={{ K8S_BASE_DIR }}/cert/etcd-key.pem \
  --trusted-ca-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --peer-cert-file={{ K8S_BASE_DIR }}/cert/etcd.pem \
  --peer-key-file={{ K8S_BASE_DIR }}/cert/etcd-key.pem \
  --peer-trusted-ca-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --peer-client-cert-auth \
  --client-cert-auth \
  --listen-peer-urls=https://{{ inventory_hostname }}:2380 \
  --initial-advertise-peer-urls=https://{{ inventory_hostname }}:2380 \
  --listen-client-urls=https://{{ inventory_hostname }}:2379,http://127.0.0.1:2379 \
  --advertise-client-urls=https://{{ inventory_hostname }}:2379 \
  --initial-cluster-token=etcd-cluster-0 \
  --initial-cluster={{ ETCD_NODES }} \
  --initial-cluster-state=new \
  --auto-compaction-mode=periodic \
  --auto-compaction-retention=1 \
  --max-request-bytes=33554432 \
  --quota-backend-bytes=6442450944 \
  --heartbeat-interval=250 \
  --election-timeout=2000
Restart=on-failure
RestartSec=5
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target