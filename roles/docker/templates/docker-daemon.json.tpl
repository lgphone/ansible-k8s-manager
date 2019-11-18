{
    "registry-mirrors": {{ DOCKER_MIRRORS }},
    "insecure-registries": {{ INSECURE_REGISTRIES }},
    "max-concurrent-downloads": 20,
    "live-restore": true,
    "max-concurrent-uploads": 10,
    "debug": true,
    "data-root": "{{ DOCKER_DIR }}/data",
    "exec-root": "{{ DOCKER_DIR }}/exec",
    "log-opts": {
      "max-size": "100m",
      "max-file": "5"
    }
}