worker_processes 1;

events {
    worker_connections  1024;
}

stream {
    upstream backend {
        hash $remote_addr consistent;
        {% for host in groups['kube-master'] -%}
        server {{ host }}:6443  max_fails=3 fail_timeout=30s;
        {% endfor -%}
    }

    server {
        listen 127.0.0.1:8443;
        proxy_connect_timeout 1s;
        proxy_pass backend;
    }
}