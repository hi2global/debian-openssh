#!/bin/bash

# 安装必要的依赖
echo "Installing dependencies..."
if ! sudo apt install build-essential zlib1g-dev libssl-dev -y; then
    echo "Failed to install dependencies."
    exit 1
fi

# 下载 OpenSSH 源码
echo "Downloading OpenSSH source..."
if ! wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.8p1.tar.gz; then
    echo "Failed to download OpenSSH source."
    exit 1
fi

# 解压缩下载的文件
echo "Extracting OpenSSH source..."
if ! tar -xzf openssh-9.8p1.tar.gz; then
    echo "Failed to extract OpenSSH source."
    exit 1
fi

cd openssh-9.8p1 || { echo "Failed to enter OpenSSH directory."; exit 1; }

# 配置和安装 OpenSSH
echo "Configuring OpenSSH..."
if ! ./configure; then
    echo "Failed to configure OpenSSH."
    exit 1
fi

echo "Building OpenSSH..."
if ! make; then
    echo "Failed to build OpenSSH."
    exit 1
fi

echo "Installing OpenSSH..."
if ! sudo make install; then
    echo "Failed to install OpenSSH."
    exit 1
fi

# 重启 SSH 服务
echo "Restarting SSH service..."
if ! sudo systemctl restart sshd; then
    echo "Failed to restart SSH service."
    exit 1
fi

echo "OpenSSH installation and setup completed successfully."
