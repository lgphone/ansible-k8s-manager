#!/bin/bash
# 生成ssh key
if [[ ! -f "/root/.ssh/id_rsa" ]];then
  echo "gen ssh key"
  ssh-keygen -t rsa -b 2048 -N '' -f /root/.ssh/id_rsa
fi
# 检测是否安装了 expect
ret_code=$(expect -v)
if [[ ${ret_code} != 0 ]];then
  echo "install expect"
  yum install expect -y
fi
# 循环文件中的ip
for p in $(cat ip.txt|grep -v '#');do
  ip=$(echo "$p"|cut -f1 -d":")       # 取出当前IP
  password=$(echo "$p"|cut -f2 -d":") # 取出当前密码
  # expect 交互过程
  expect -c "
spawn ssh-copy-id -i /root/.ssh/id_rsa.pub root@$ip
        expect {
                \"*yes/no*\" {send \"yes\r\"; exp_continue}
                \"*password*\" {send \"$password\r\"; exp_continue}
                \"*Password*\" {send \"$password\r\";}
        }
"
done