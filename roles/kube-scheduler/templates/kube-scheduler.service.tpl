[Unit]
Description=Kubernetes Scheduler
Documentation=https://github.com/GoogleCloudPlatform/kubernetes

[Service]
WorkingDirectory={{ K8S_DATA_BASE_DIR }}/kube-scheduler
ExecStart={{ K8S_BASE_DIR }}/bin/kube-scheduler \
  --config={{ K8S_BASE_DIR }}/conf/kube-scheduler-config.yaml \
  --bind-address={{ inventory_hostname }} \
  --secure-port=10259 \
  --port=0 \
  --tls-cert-file={{ K8S_BASE_DIR }}/cert/kube-scheduler.pem \
  --tls-private-key-file={{ K8S_BASE_DIR }}/cert/kube-scheduler-key.pem \
  --authentication-kubeconfig={{ K8S_BASE_DIR }}/conf/kube-scheduler.kubeconfig \
  --client-ca-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --requestheader-allowed-names="" \
  --requestheader-client-ca-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --requestheader-extra-headers-prefix="X-Remote-Extra-" \
  --requestheader-group-headers=X-Remote-Group \
  --requestheader-username-headers=X-Remote-User \
  --authorization-kubeconfig={{ K8S_BASE_DIR }}/conf/kube-scheduler.kubeconfig \
  --logtostderr=true \
  --v=2
Restart=always
RestartSec=5
StartLimitInterval=0

[Install]
WantedBy=multi-user.target