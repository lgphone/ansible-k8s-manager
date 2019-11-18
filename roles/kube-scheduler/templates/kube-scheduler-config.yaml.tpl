apiVersion: kubescheduler.config.k8s.io/v1alpha1
kind: KubeSchedulerConfiguration
bindTimeoutSeconds: 600
clientConnection:
  burst: 200
  kubeconfig: "{{ K8S_BASE_DIR }}/conf/kube-scheduler.kubeconfig"
  qps: 100
enableContentionProfiling: false
enableProfiling: true
hardPodAffinitySymmetricWeight: 1
healthzBindAddress: {{ inventory_hostname }}:10251
leaderElection:
  leaderElect: true
metricsBindAddress: {{ inventory_hostname }}:10251