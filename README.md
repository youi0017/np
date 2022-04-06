# DockerRepo for nginx+php


### 二 使用说明



#### 2.1 运行容器:


* 启动参考一(一般测试用)
podman run -itd --name web1 -p 9001:80 nginx

* 启动参考二(最常用:绑定目录+挂载主机配置)
podman run -itd --name web22 -p 9002:80 -v /www/vhosts/9001:/www/html -v /www/vconfigs:/etc/nginx/http.d np


* 启动参考三(绑定目录)
podman run -itd --name web3 -p 9001:80 -v /www/vhosts/9001:/www/html nginx

* 启动参考四(绑定目录+日志)
podman run -itd --name web4 -p 9001:80 -v /www/vhosts/9001:/www/html -v /www/vhots/log:/var/log/nginx nginx


#使用说明:
# 如挂载容器的'网站目录',先在宿主机挂载目录中准备后源程序,执行run后,会自动将此目录内容复制到 /www/html/目录下,且注意重启容器会更容器目录内容,否则不会动态生效.



#### 2.2 www目录挂载

宿主机目录结构:
```
|-vhosts
	|-www		网站根目录
	|-config	主机配置目录(设置根目录、域名等)
	|-log		日志

```

创建语句：
```
mkdir -p /vhosts/www /vhosts/config /vhosts/log
chmod 0777 /vhosts/www
```

说明:如挂载容器的'网站目录',先在宿主机挂载目录中准备后源程序,执行run后,会自动将此目录内容复制到 /www/html/目录下,且注意重启容器会更容器目录内容,否则不会动态生效.


