# ansible-k8s-manager
基于Ansible的k8s集群部署和管理

介绍
* 基于ansible 自动化部署k8s集群，k8s版本为1.16.2
* 修改inventory 为自己服务器集群的ip数据 etcd 至少三台机器


预先步骤:
1. 将要部署的机器内核升级到最新稳定版本
2. 将要部署的机器配置到inventory
3. 将inventory中的服务器信息按格式写入ip.txt中
4. bash send_ssh_key.sh  # 配置免密码登录
5. 控制端安装ansible # yum install python-pip -y && pip install ansible

部署步骤
1. ansible-playbook -i inventory 01_system_init.yml # 初始化服务器
2. source /etc/profile  # 使得PATH 变量在当前窗口生效
3. ansible-playbook -i inventory 02_base.yml # 部署基础项目etcd flanneld 等
4. ansible-playbook -i inventory 03_master.yml # 部署master节点服务
5. ansible-playbook -i inventory 04_node.yml # 部署node节点服务
