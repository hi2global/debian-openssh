# 手动更新Debian/Ubuntu的OpenSSH版本，基于ChatGPT编写

版本：**OpenSSH 9.8/9.8p1 (2024-07-01)**

检查版本号
```bash
ssh -V
```
执行脚本
```bash
curl -sSL https://raw.githubusercontent.com/hi2global/debian-openssh/main/install.sh | bash
```

主要是我自己方便使用，目前跑下来发现`sudo systemctl restart sshd`没有更新到ssh版本，需要`reboot`，（菜鸟不会了

清理旧文件，谨慎使用！
```bash
rm -rf ~/openssh-*
```
