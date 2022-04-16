# DockerRepo for nginx+php

> 本目录用于 使用PHP框架 时, 快速部署项目.


### 宿主机目录结构:
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

### 运行容器:


* 启动参考一(绑定目录+配置)
适用于: 一个容器一个站,使用默认80端口
podman run -itd --name web -p 9001:80 -v /webroot/www:/www -v /webroot/config:/etc/nginx/http.d np:latest

* 启动参考二(绑定目录+配置)
适用于: 一个容器多个站,各自定义自已的端口
podman run -itd --name allweb --net host -v /webroot/www:/www -v /webroot/config:/etc/nginx/http.d np:latest


### 其它说明:
如挂载容器的'网站目录',先在宿主机挂载目录中准备后源程序,执行run后,会自动将此目录内容复制到 /www/目录下,且注意重启容器会更容器目录内容,否则不会动态生效.



#### 2.2 www目录挂载


说明:如挂载容器的'网站目录',先在宿主机挂载目录中准备后源程序,执行run后,会自动将此目录内容复制到 /www/html/目录下,且注意重启容器会更容器目录内容,否则不会动态生效.


