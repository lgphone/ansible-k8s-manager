[Unit]
Description=Kubernetes Controller Manager
Documentation=https://github.com/GoogleCloudPlatform/kubernetes

[Service]
WorkingDirectory={{ K8S_DATA_BASE_DIR }}/kube-controller-manager
ExecStart={{ K8S_BASE_DIR }}/bin/kube-controller-manager \
  --profiling \
  --cluster-name=kubernetes \
  --controllers=*,bootstrapsigner,tokencleaner \
  --kube-api-qps=1000 \
  --kube-api-burst=2000 \
  --leader-elect \
  --use-service-account-credentials\
  --concurrent-service-syncs=2 \
  --bind-address={{ inventory_hostname }} \
  --secure-port=10252 \
  --tls-cert-file={{ K8S_BASE_DIR }}/cert/kube-controller-manager.pem \
  --tls-private-key-file={{ K8S_BASE_DIR }}/cert/kube-controller-manager-key.pem \
  --port=0 \
  --authentication-kubeconfig={{ K8S_BASE_DIR }}/conf/kube-controller-manager.kubeconfig \
  --client-ca-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --requestheader-allowed-names="" \
  --requestheader-client-ca-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --requestheader-extra-headers-prefix="X-Remote-Extra-" \
  --requestheader-group-headers=X-Remote-Group \
  --requestheader-username-headers=X-Remote-User \
  --authorization-kubeconfig={{ K8S_BASE_DIR }}/conf/kube-controller-manager.kubeconfig \
  --cluster-signing-cert-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --cluster-signing-key-file={{ K8S_BASE_DIR }}/cert/ca-key.pem \
  --experimental-cluster-signing-duration=876000h \
  --horizontal-pod-autoscaler-sync-period=10s \
  --concurrent-deployment-syncs=10 \
  --concurrent-gc-syncs=30 \
  --node-cidr-mask-size=24 \
  --service-cluster-ip-range={{ SERVICE_CIDR }} \
  --pod-eviction-timeout=6m \
  --terminated-pod-gc-threshold=10000 \
  --root-ca-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --service-account-private-key-file={{ K8S_BASE_DIR }}/cert/ca-key.pem \
  --kubeconfig={{ K8S_BASE_DIR }}/conf/kube-controller-manager.kubeconfig \
  --logtostderr=true \
  --v=2
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target