# DockerRepo for nginx+php


### �� ʹ��˵��



#### 2.1 ��������:


* �����ο�һ(һ�������)
podman run -itd --name web1 -p 9001:80 nginx

* �����ο���(���:��Ŀ¼+������������)
podman run -itd --name web22 -p 9002:80 -v /www/vhosts/9001:/www/html -v /www/vconfigs:/etc/nginx/http.d np


* �����ο���(��Ŀ¼)
podman run -itd --name web3 -p 9001:80 -v /www/vhosts/9001:/www/html nginx

* �����ο���(��Ŀ¼+��־)
podman run -itd --name web4 -p 9001:80 -v /www/vhosts/9001:/www/html -v /www/vhots/log:/var/log/nginx nginx


#ʹ��˵��:
# �����������'��վĿ¼',��������������Ŀ¼��׼����Դ����,ִ��run��,���Զ�����Ŀ¼���ݸ��Ƶ� /www/html/Ŀ¼��,��ע�����������������Ŀ¼����,���򲻻ᶯ̬��Ч.



#### 2.2 wwwĿ¼����

������Ŀ¼�ṹ:
```
|-vhosts
	|-www		��վ��Ŀ¼
	|-config	��������Ŀ¼(���ø�Ŀ¼��������)
	|-log		��־

```

������䣺
```
mkdir -p /vhosts/www /vhosts/config /vhosts/log
chmod 0777 /vhosts/www
```

˵��:�����������'��վĿ¼',��������������Ŀ¼��׼����Դ����,ִ��run��,���Զ�����Ŀ¼���ݸ��Ƶ� /www/html/Ŀ¼��,��ע�����������������Ŀ¼����,���򲻻ᶯ̬��Ч.


