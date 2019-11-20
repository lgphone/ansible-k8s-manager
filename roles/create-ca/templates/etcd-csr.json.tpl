{
  "CN": "etcd",
  "hosts": [
    "127.0.0.1",
    {% for host in groups['etcd'] -%}
    "{{ host }}",
    {% endfor -%}
    "backup.etcd.hosts1",
    "backup.etcd.hosts2",
    "backup.etcd.hosts3"
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