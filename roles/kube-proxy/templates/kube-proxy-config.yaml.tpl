kind: KubeProxyConfiguration
apiVersion: kubeproxy.config.k8s.io/v1alpha1
clientConnection:
  burst: 200
  kubeconfig: "{{ K8S_BASE_DIR }}/conf/kube-proxy.kubeconfig"
  qps: 100
bindAddress: {{ inventory_hostname }}
healthzBindAddress: {{ inventory_hostname }}:10256
metricsBindAddress: {{ inventory_hostname }}:10249
enableProfiling: true
clusterCIDR: {{ CLUSTER_CIDR }}
hostnameOverride: {{ NODE_NAME }}
mode: "ipvs"
portRange: ""
kubeProxyIPTablesConfiguration:
  masqueradeAll: false
kubeProxyIPVSConfiguration:
  scheduler: rr
  excludeCIDRs: []