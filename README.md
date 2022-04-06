# DockerRepo for nginx+php


### 一 基础说明
基于 nginx1.20+php7.4 的镜像, 具备基本运行配置和模块.


### 二 使用说明

#### 2.1 运行容器:

* 启动参考一(测试用)
podman run -itd --name web1 -p 9001:80 nginx

* 启动参考二(最常用:绑定目录+挂载主机配置)
podman run -itd --name web2 -p 9001:80 -v /vhosts/first/www:/www -v /vhosts/first/config:/etc/nginx/http.d np


* 启动参考三(绑定目录)
podman run -itd --name web3 -p 9001:80 -v /www/vhosts/9001:/www/html nginx

* 启动参考四(绑定目录+日志)
podman run -itd --name web4 -p 9001:80 -v /www/vhosts/9001:/www/html -v /www/vhots/log:/var/log/nginx nginx


#### 2.2 www目录挂载

宿主机目录结构:
注意: 一容器对应多站点时,使用下面结构. 如果是一对一,则www直接放一个站的文件.
```
|-webroot
	|-www		虚拟主机根目录
		|-hostA		虚拟主机A
			|- file0
			|- file9
		|-hostB		虚拟主机B
		|-hostC		虚拟主机C
	|-config	主机配置目录(设置根目录、域名等)
		|-hostA.conf		虚拟主机A配置
		|-hostB.conf		虚拟主机B配置
		|-hostC.conf		虚拟主机C配置
	|-log		日志
```


创建语句：
```
[root] mkdir /webroot
[root] cd /webroot
[root] mkdir vhosts config log
[root] chmod -R 0777 /webroot

[user] mkdir /webroot/vhosts/first
chmod 0777 /vhosts/www
```

说明:如挂载容器的'网站目录',先在宿主机挂载目录中准备后源程序,执行run后,会自动将此目录内容复制到 /www/html/目录下,且注意重启容器会更容器目录内容,否则不会动态生效.



### 三 其它说明

推荐: 一个容器一个站, 容器之间互不影响,且安全.  



