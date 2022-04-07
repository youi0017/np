#!/bin/sh

/usr/sbin/php-fpm7
/usr/sbin/nginx



if [ "$1" = 'nginx' ]; then
  echo "执行[nginx]命令:$*"
  # cmd='ls -l'
  # ${cmd}
  # eval "$cmd"
  eval "$*"

elif [ "$1" = 'php' ]; then
  echo "执行[php]命令:$*"
  eval "$*"
else
  echo '请使用 [nginx] 或 [php] 指令'
fi

