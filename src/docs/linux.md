---
icon: user
title: Termux安装Linux容器
date: 2024-02-18
category:
  - 手机
tag:
  - Linux
  - Termux
---

<!-- more -->

> 在这之前请先确保已安装Termux或ZeroTermux  
> [点击前往安装](./termux.md)

### 1.更新软件源

```bash
apt update
```

### 2.安装依赖软件包

```bash
apt install proot git python -y
```

### 3.克隆脚本仓库到本地

```bash
cd ~/
git clone https://gitee.com/DengFengLai-F/termux-install-linux.git
```

### 4.运行脚本

```bash
cd ~/termux-install-linux
python termux-linux-install.py
```

![](/img/linux.jpg)
输入你需要的安装的系统对应的数字回车就行了

### Ubuntu

安装成功后，可以直接这样启动：

```bash
cd ~/Termux-Linux/Ubuntu
./start-ubuntu.sh
```

### Kali

这个 Kali 是轻量级的，大家要安装完整的 Kali Nethunter 的话 ，可以参考 Termux 文章里面的操作细节: [Termux 高级终端安装使用配置教程: Kali NetHunter](https://www.sqlsec.com/2018/05/termux.html#toc-heading-112)

```bash
cd ~/Termux-Linux/Kali
./start-kali.sh
```

### Debian

```bash
cd ~/Termux-Linux/Debian
./start-debian.sh
```

::: tip 进阶用法
可以通过设置命令别名的方式从而达到快速启动容器的效果  
这里以Ubuntu为例：

```bash
echo "alias u='~/Termux-Linux/Ubuntu/start-ubuntu.sh'" >> ~/.bashrc
```

设置完成后重启终端就可以用`u`命令快速启动了，命令名称和启动路径按需求修改就行。
:::

## 参考贡献

- [Termux一键安装Linux脚本](https://github.com/sqlsec/termux-install-linux)
