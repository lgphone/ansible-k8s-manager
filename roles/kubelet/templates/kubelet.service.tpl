[Unit]
Description=Kubernetes Kubelet
Documentation=https://github.com/GoogleCloudPlatform/kubernetes
After=docker.service
Requires=docker.service

[Service]
WorkingDirectory={{ K8S_DATA_BASE_DIR }}/kubelet
ExecStart={{ K8S_BASE_DIR }}/bin/kubelet \
  --bootstrap-kubeconfig={{ K8S_BASE_DIR }}/conf/kubelet-bootstrap.kubeconfig \
  --cert-dir={{ K8S_BASE_DIR }}/cert \
  --cni-conf-dir=/etc/cni/net.d \
  --container-runtime=docker \
  --container-runtime-endpoint=unix:///var/run/dockershim.sock \
  --root-dir={{ K8S_DATA_BASE_DIR }}/kubelet \
  --kubeconfig={{ K8S_BASE_DIR }}/conf/kubelet.kubeconfig \
  --config={{ K8S_BASE_DIR }}/conf/kubelet-config.yaml \
  --hostname-override={{ NODE_NAME }} \
  --pod-infra-container-image=registry.cn-beijing.aliyuncs.com/images_k8s/pause-amd64:3.1 \
  --image-pull-progress-deadline=15m \
  --volume-plugin-dir={{ K8S_DATA_BASE_DIR }}/kubelet/kubelet-plugins/volume/exec/ \
  --logtostderr=true \
  --v=2
Restart=always
RestartSec=5
StartLimitInterval=0

[Install]
WantedBy=multi-user.target