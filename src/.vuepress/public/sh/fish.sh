#!/bin/bash

# apt 替换清华源
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
apt update

# 安装 fish
if ! command -v fish >/dev/null 2>&1; then
    clear
    echo "fish已安装，正在为您处理别名迁移"
else
    echo "fish 未安装，正在为您安装"
    apt install fish -y
fi



# 设置 fish 为默认 shell
echo "shell=/data/data/com.termux/files/usr/bin/fish" > ~/.termux/termux.properties

# 提取bash配置文件中未被注释的别名定义，并检查是否正确
while IFS= read -r line; do
    if [[ $line =~ ^alias\  ]]; then
        alias_name=$(echo "$line" | awk '{print $2}' | sed 's/=.*//')
        alias_command=$(echo "$line" | awk -F"'" '{print $2}')
        if command -v "$alias_command" >/dev/null 2>&1; then
            echo "abbr -a $alias_name $alias_command" >> ~/.config/fish/config.fish
        else
            echo "警告：别名 '$alias_name' 指向不存在的命令 '$alias_command'，未添加到fish配置文件"
        fi
    fi
done < <(grep '^alias ' ~/.bashrc | grep -v '^#' | grep -vE '^#')

echo -e "\e[1;32m别名已成功转移至fish配置文件\e[0m"

sleep 2

clear

echo -e "\e[1;33m为您安装一些常用依赖和软件包\e[0m"
sleep 3

apt install -y git nano curl wget htop 

sleep 0.5
clear

echo '安装 nodejs 和 npm'
apt install -y nodejs npm

sleep 0.5
clear

echo '全局安装 pnpm'
node -v
npm i pnpm -g

echo 完成