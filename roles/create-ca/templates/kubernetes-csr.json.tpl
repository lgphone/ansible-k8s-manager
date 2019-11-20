{
  "CN": "kubernetes",
  "hosts": [
    "127.0.0.1",
    {%- for host in groups['kube-master'] -%}
     "{{ host }}",
    {%- endfor -%}
    "{{ CLUSTER_KUBERNETES_SVC_IP }}",
    "kubernetes",
    "kubernetes.default",
    "kubernetes.default.svc",
    "kubernetes.default.svc.cluster",
    "kubernetes.default.svc.cluster.local."
  ],
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "CN",
      "ST": "BeiJing",
      "L": "BeiJing",
      "O": "k8s",
      "OU": "System"
    }
  ]
}