{
  "CN": "system:kube-controller-manager",
  "hosts": [
    {% for host in groups['kube-master'] %}
    "{{ host }}",
    {% endfor %}
    "127.0.0.1"
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
      "O": "system:kube-controller-manager",
      "OU": "System"
    }
  ]
}