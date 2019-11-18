[Unit]
Description=Flanneld overlay address etcd agent
After=network.target
After=network-online.target
Wants=network-online.target
After=etcd.service
Before=docker.service

[Service]
Type=notify
ExecStart={{ K8S_BASE_DIR }}/bin/flanneld \
  -etcd-cafile={{ K8S_BASE_DIR }}/cert/ca.pem \
  -etcd-certfile={{ K8S_BASE_DIR }}/cert/flanneld.pem \
  -etcd-keyfile={{ K8S_BASE_DIR }}/cert/flanneld-key.pem \
  -etcd-endpoints={{ ETCD_ENDPOINTS }} \
  -etcd-prefix={{ FLANNEL_ETCD_PREFIX }} \
  -iface={{ ansible_default_ipv4['interface'] }} \
  -ip-masq
ExecStartPost={{ K8S_BASE_DIR }}/bin/mk-docker-opts.sh -k DOCKER_NETWORK_OPTIONS -d /run/flannel/docker
Restart=always
RestartSec=5
StartLimitInterval=0

[Install]
WantedBy=multi-user.target
RequiredBy=docker.service