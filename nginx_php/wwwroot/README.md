# DockerRepo for nginx+php

> ��Ŀ¼���� ʹ��PHP��� ʱ, ���ٲ�����Ŀ.


### ������Ŀ¼�ṹ:
```
|-webroot
	|-www		����������Ŀ¼
		|-hostA		��������A
			|- file0
			|- file9
		|-hostB		��������B
		|-hostC		��������C
	|-config	��������Ŀ¼(���ø�Ŀ¼��������)
		|-hostA.conf		��������A����
		|-hostB.conf		��������B����
		|-hostC.conf		��������C����
	|-log		��־
```

������䣺
```
[root] mkdir /webroot
[root] cd /webroot
[root] mkdir vhosts config log
[root] chmod -R 0777 /webroot

[user] mkdir /webroot/vhosts/first
chmod 0777 /vhosts/www
```

### ��������:


* �����ο�һ(��Ŀ¼+����)
������: һ������һ��վ,ʹ��Ĭ��80�˿�
podman run -itd --name web -p 9001:80 -v /webroot/www:/www -v /webroot/config:/etc/nginx/http.d np:latest

* �����ο���(��Ŀ¼+����)
������: һ���������վ,���Զ������ѵĶ˿�
podman run -itd --name allweb --net host -v /webroot/www:/www -v /webroot/config:/etc/nginx/http.d np:latest


### ����˵��:
�����������'��վĿ¼',��������������Ŀ¼��׼����Դ����,ִ��run��,���Զ�����Ŀ¼���ݸ��Ƶ� /www/Ŀ¼��,��ע�����������������Ŀ¼����,���򲻻ᶯ̬��Ч.



#### 2.2 wwwĿ¼����


˵��:�����������'��վĿ¼',��������������Ŀ¼��׼����Դ����,ִ��run��,���Զ�����Ŀ¼���ݸ��Ƶ� /www/html/Ŀ¼��,��ע�����������������Ŀ¼����,���򲻻ᶯ̬��Ч.


