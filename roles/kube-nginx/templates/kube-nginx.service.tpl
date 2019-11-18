[Unit]
Description=kube-apiserver nginx proxy
After=network.target
After=network-online.target
Wants=network-online.target

[Service]
Type=forking
ExecStartPre={{ KUBE_NGINX_INSTALL_DIR }}/sbin/nginx -c {{ KUBE_NGINX_INSTALL_DIR }}/conf/nginx.conf -p {{ KUBE_NGINX_INSTALL_DIR }} -t
ExecStart={{ KUBE_NGINX_INSTALL_DIR }}/sbin/nginx -c {{ KUBE_NGINX_INSTALL_DIR }}/conf/nginx.conf -p {{ KUBE_NGINX_INSTALL_DIR }}
ExecReload={{ KUBE_NGINX_INSTALL_DIR }}/sbin/nginx -c {{ KUBE_NGINX_INSTALL_DIR }}/conf/nginx.conf -p {{ KUBE_NGINX_INSTALL_DIR }} -s reload
PrivateTmp=true
Restart=always
RestartSec=5
StartLimitInterval=0
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target