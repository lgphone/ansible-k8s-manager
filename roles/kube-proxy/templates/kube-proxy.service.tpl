[Unit]
Description=Kubernetes Kube-Proxy Server
Documentation=https://github.com/GoogleCloudPlatform/kubernetes
After=network.target

[Service]
WorkingDirectory={{ K8S_DATA_BASE_DIR }}/kube-proxy
ExecStart={{ K8S_BASE_DIR }}/bin/kube-proxy \
  --config={{ K8S_BASE_DIR }}/conf/kube-proxy-config.yaml \
  --logtostderr=true \
  --v=2
Restart=on-failure
RestartSec=5
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target