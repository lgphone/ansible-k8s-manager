[Unit]
Description=Kubernetes API Server
Documentation=https://github.com/GoogleCloudPlatform/kubernetes
After=network.target

[Service]
WorkingDirectory={{ K8S_DATA_BASE_DIR }}/kube-apiserver
ExecStart={{ K8S_BASE_DIR }}/bin/kube-apiserver \
  --advertise-address={{ inventory_hostname }} \
  --default-not-ready-toleration-seconds=360 \
  --default-unreachable-toleration-seconds=360 \
  --feature-gates=DynamicAuditing=true \
  --max-mutating-requests-inflight=2000 \
  --max-requests-inflight=4000 \
  --default-watch-cache-size=200 \
  --delete-collection-workers=2 \
  --encryption-provider-config={{ K8S_BASE_DIR }}/conf/encryption-config.yaml \
  --etcd-cafile={{ K8S_BASE_DIR }}/cert/ca.pem \
  --etcd-certfile={{ K8S_BASE_DIR }}/cert/kubernetes.pem \
  --etcd-keyfile={{ K8S_BASE_DIR }}/cert/kubernetes-key.pem \
  --etcd-servers={{ ETCD_ENDPOINTS }} \
  --bind-address={{ inventory_hostname }} \
  --secure-port=6443 \
  --tls-cert-file={{ K8S_BASE_DIR }}/cert/kubernetes.pem \
  --tls-private-key-file={{ K8S_BASE_DIR }}/cert/kubernetes-key.pem \
  --insecure-port=0 \
  --audit-dynamic-configuration \
  --audit-log-maxage=15 \
  --audit-log-maxbackup=3 \
  --audit-log-maxsize=100 \
  --audit-log-truncate-enabled \
  --audit-log-path={{ K8S_DATA_BASE_DIR }}/kube-apiserver/audit.log \
  --audit-policy-file={{ K8S_BASE_DIR }}/conf/audit-policy.yaml \
  --profiling \
  --anonymous-auth=false \
  --client-ca-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --enable-bootstrap-token-auth \
  --requestheader-allowed-names="aggregator" \
  --requestheader-client-ca-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --requestheader-extra-headers-prefix="X-Remote-Extra-" \
  --requestheader-group-headers=X-Remote-Group \
  --requestheader-username-headers=X-Remote-User \
  --service-account-key-file={{ K8S_BASE_DIR }}/cert/ca.pem \
  --authorization-mode=Node,RBAC \
  --runtime-config=api/all=true \
  --enable-admission-plugins=NodeRestriction \
  --allow-privileged=true \
  --apiserver-count=3 \
  --event-ttl=168h \
  --kubelet-certificate-authority={{ K8S_BASE_DIR }}/cert/ca.pem \
  --kubelet-client-certificate={{ K8S_BASE_DIR }}/cert/kubernetes.pem \
  --kubelet-client-key={{ K8S_BASE_DIR }}/cert/kubernetes-key.pem \
  --kubelet-https=true \
  --kubelet-timeout=10s \
  --proxy-client-cert-file={{ K8S_BASE_DIR }}/cert/aggregator.pem \
  --proxy-client-key-file={{ K8S_BASE_DIR }}/cert/aggregator-key.pem \
  --service-cluster-ip-range={{ SERVICE_CIDR }} \
  --service-node-port-range={{ NODE_PORT_RANGE }} \
  --logtostderr=true \
  --v=2
Restart=on-failure
RestartSec=10
Type=notify
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target