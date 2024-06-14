---
icon: bolt
date: 2024-02-18
category:
  - 手机
  - APP
tag:
  - 终端
  - APP
  - 开源
  - 便捷
  - 开发
---

# 手机Termux安装与使用

<!-- more -->

### Termux是什么

Termux是一款强大的开源Android终端模拟器，将Linux环境引入手机平台，为用户提供丰富的命令行工具和软件包支持。无论是编程、系统管理还是网络操作，都可以在手机上灵活运用。对于移动端开发者和技术爱好者而言，Termux不仅是便捷的工具，更是一个开放的平台，拓展了移动设备的应用领域，让用户轻松实现更多复杂任务和自定义操作。

---

### 下载Termux

我们可以在[Github](https://github.com/termux/termux-app)上浏览Termux的源代码

Termux安装包下载：  
[Github发行版](https://github.com/termux/termux-app/releases) | [GitHub Proxy代理加速](https://mirrors.chenby.cn/https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk)

需要注意的是原版的Termux似乎很长一段时间没有维护更新了，因此我们推荐使用下文的`ZeroTermux`

---

### ZeroTermux

对于中国大陆用户，我们推荐使用[ZeroTermux](https://github.com/hanxinhao000/ZeroTermux)

它拥有更完善的个性化功能，更简洁的操作界面，更方便的会话管理，更完善的下载源和更适合中国宝宝体质的==中文界面==。

ZeroTermux安装包下载：  
[Github](https://github.com/hanxinhao000/ZeroTermux) | [发行版](https://github.com/hanxinhao000/ZeroTermux/releases) | [官方下载站](https://od.ixcmstudio.cn/repository/main/ZeroTermux/) | [一键下载](https://od.ixcmstudio.cn/repository/main/ZeroTermux/ZeroTermux%20-0.118.21.apk)  
选择一种方式下载最新版本就行了

::: tip 什么是ZeroTermux
ZeroTermux基于Termux进行修改，内置一键切换apt/pkg软件源、一键备份恢复等多种便捷功能（您可以前往我们的社区下载恢复包）让您快速拥有发行版Linux环境，软件还拥有各种便于您使用的功能，例如字体切换、后台悬浮小窗、美化和在线shell脚本等
:::

---

### 安装

和普通APP一样安装就行了，安装过程中部分手机可能会出现风险提示，无视风险就行了，如果系统禁止安装请自行百度如何关闭。

安装过程太过简单就不一一说明了

---

### 使用Termux

进入软件后会要求阅读用户协议，一直划到最底下然后点击同意就可以了。  
首次打开Termux要先授予`所有文件访问权限`和`始终在后台运行权限`

Termux内置了`apt`和`pkg`两个包管理器，可以使用这两个包管理器在模拟终端环境中安装软件包

首先我们需要更新一下软件源，如果你使用的是Termux而不是ZeroTermux的话，首先执行以下任意一条命令换源并自动更新软件包，复制粘贴到终端然后回车即可。

::: code-tabs#shell

@tab 清华源

```bash
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
```

@tab 北京源

```bash
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.bfsu.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
```

@tab NJU

```bash
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirror.nju.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list &&sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirror.nju.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list
```

:::

换源完成后我们就可以安装自己需要的软件包了  
这里以安装node.js为例：

```bash
# 更新 apt 软件包列表
apt update # 安装前请务必更新一次

# 更新 pkg 软件包列表
pkg update

# 使用 apt 安装 node.js
apt install nodejs -y # -y 表示自动确认所有提示

# 使用 pkg 安装 node.js
pkg install nodejs -y
```

Termux是使用bash解释器的，因此bash脚本也能够在Termux上运行，同时可以在Termux上安装其他Linux发行版的容器，从而达到更完美的使用体验。

[<HopeIcon icon="linux" />linux容器安装教程](./linux.md)
