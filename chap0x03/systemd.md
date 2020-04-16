# 动手实战Systmd-开机自启动项管理

## 实验目的
- 完成Systemd入门教程并全程录像，上传github
- init缺点：启动时间长，启动脚本复杂
- Systemd优点：使用配置文件的方式更方便，对自启动项目管理更有效安全，并且易于用户配置
  
## 实验环境
- Ubuntu 18.04.4-server
- 配置文件Systemd
- Asciinema recorder

## 实验步骤

### A.命令篇

- 1-3节：[![asciicast](https://asciinema.org/a/Lp17fnzgpT8wb7vxLd6JXKMzP.svg)](https://asciinema.org/a/Lp17fnzgpT8wb7vxLd6JXKMzP)

- 第4节：[![asciicast](https://asciinema.org/a/b7hOWIOs78bJTAgSrpkOgZNrV.svg)](https://asciinema.org/a/b7hOWIOs78bJTAgSrpkOgZNrV)

- 第5节：[![asciicast](https://asciinema.org/a/ivArLAadgY52JWPAwCOCynzu5.svg)](https://asciinema.org/a/ivArLAadgY52JWPAwCOCynzu5)

- 第6节：[![asciicast](https://asciinema.org/a/FLPw7G1P3nCH6m9z14IGMxsL2.svg)](https://asciinema.org/a/FLPw7G1P3nCH6m9z14IGMxsL2)

- 第7节：[![asciicast](https://asciinema.org/a/euJkUtL1g5ny718MqCI8dIzDT.svg)](https://asciinema.org/a/euJkUtL1g5ny718MqCI8dIzDT)


### B.实战篇

- 第1-4节：[![asciicast](https://asciinema.org/a/36S8fL6fWkoCle22W0BPAZKuR.svg)](https://asciinema.org/a/36S8fL6fWkoCle22W0BPAZKuR)

- 第7-9节：[![asciicast](https://asciinema.org/a/whp93bjKbO9kcTYpUX2TmPJq6.svg)](https://asciinema.org/a/whp93bjKbO9kcTYpUX2TmPJq6)


## 自查清单

1.如何添加一个用户并使其具备sudo执行成簇的权限？
    - 通过`adduser username`添加用户
    - 将`username`放到`sudo`用户组

2.如何将一个用户添加到一个用户组
    - `sudo addusername sudo`

3.如何查看当前系统的分期表和文件系统详细信息
    - `sudo sfdisk`或者`sudo cfdisk`查看分区表
    - `df -a`或者`stat -f`查看文件系统的详细信息

4.如何实现开机自动挂载virtualbox的共享目录分区

    - 在virtualbox中打开添加共享文件夹，打开自动挂载和固定分配
    - `sudo /media/cdrom/./VboxLinuxAddtions.run`安装增强功能
    - `sudo mount -t vboxsf shard ~/shard`将共享文件夹挂载到shard目录
    - virtualbox中的选项**自动挂载**可以实现开机自动挂载，也可以通过systemd实现
    - 编写文件`my_mount-src_host.automount`
  
    ```bash
    [Unit]
    Description=Auto mount shard "src" folder

    [Automount]
    Where=~/shared
    DictionaryMode=0775
    Type=vbosf

    [Install]
    WantedBy=mull-user.target

    - 执行`systemd enable my_mount-src_host.automount`

5.基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？
 #缩容 lvreduce --size size dir
 #扩容 lvextend --size size dir

6.如何通过systemd设置实现在网络联通时运行一个指定脚本，在网络断开时运行另一个脚本？
     - 网络连通启动脚本配置
       [unit]Description=After network up
       After=network.target network-online.target
       [service]
       Type=oneshot
       ExecStart=_YOUR_SCRIPT_

       [Install]
       WantedBy=multi-user.target

7.如何使用stsyemd设置实现一个脚本在任何情况下被杀死之后会立即启动？实现杀不死？
     - 创建service文件
       
       [Unit]
       Description=My Script

       [Service]
       Type=forking
       ExecStart=/usr/bin/MY_SCRIPT
       ExecStart=/usr/bin/MY_SCRIPT
       Restart=always
       RestartSec=1
       RemainAfterExit=yes

       [Install]
       WantedBy=mull-user.target

    - 重新加载配置，并启动，其中在MY_SCRIPT中添加一句`systemd start my_script.service`再次避免service被停止

## 参考资料
   - Systemd 入门教程：命令篇BY阮一峰的网络日志（http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html）
   - Systemd 入门教程：实战篇BY阮一峰的网络日志（http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html）

## 实验收获
   - 学习了systemd的基本操作命令和开发思想，并动手实践操作
   - 感受到了它和其他init软件的区别，的确提供了更优秀的框架来表示系统服务间的依赖关系
