#!/data/data/com.termux/files/usr/bin/bash

# 替换 apt 源为清华源
sed -i 's@^deb .*main$@deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
apt update

# 安装 fish
if ! command -v fish >/dev/null 2>&1; then
    clear
    echo "fish 未安装，正在为您安装"
    apt install fish -y
    sleep 2
else
    echo "fish 已安装，正在为您处理别名迁移"
fi

# 提取 bash 配置文件中未被注释的别名定义，并迁移到 fish 配置文件
while IFS= read -r line; do
    if [[ $line =~ ^alias\  ]]; then
        alias_name=$(echo "$line" | awk '{print $2}' | sed 's/=.*//')
        alias_command=$(echo "$line" | awk -F"'" '{print $2}')
        echo "abbr -a $alias_name '$alias_command'" >> ~/.config/fish/config.fish
        fi
    fi
done < <(grep '^alias ' ~/.bashrc | grep -v '^#' | grep -vE '^#')

echo -e "\e[1;32m别名已成功转移至 fish 配置文件\e[0m"
echo 'fish' >> ~/.bashrc

sleep 2
clear

echo -e "\e[1;33m为您安装一些常用依赖和软件包\e[0m"
sleep 3

apt install -y git nano curl wget htop

sleep 2
clear

echo '安装 Node.js 和 npm'
apt install -y nodejs

sleep 2
clear

echo '全局安装 pnpm'
node -v
npm i -g pnpm

echo '完成'