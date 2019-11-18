{
  "CN": "system:kube-scheduler",
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
      "O": "system:kube-scheduler",
      "OU": "System"
    }
  ]
}