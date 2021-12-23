# kirdyashkindi_infra
kirdyashkindi Infra repository

## Лекция 5. Знакомство с облачной инфраструктурой Yandex.Cloud

### Способ подключения в одну строку:

Можно выполнить командой

`ssh -i ~/.ssh/appuser -A appuser@51.250.4.53 ssh -tt appuser@10.128.0.5`

Второй вариант - использовать перенаправление портов

### Дополнительное задание:

* Добавить в /etc/hosts бастиона сопоставление IP адреса и имени someinternalhost;
* авторизоваться с бастиона на машине, используя имя узла, чтобы внести запись в known_hosts;
* на локальной машине добавить алиас вида
`alias ssh-someinternalhost='ssh -i ~/.ssh/appuser -A appuser@51.250.4.53 ssh -tt appuser@someinternalhost`.
* после этого, при вызове `ssh-someinternalhost` будет установлено подключение к someinternalhost

### VPN-сервер для серверов Yandex.Cloud

* Поскольку скрипт установки неактуален (для задания положил в корень репа), воспользовался следующим гайдом: https://computingforgeeks.com/install-and-configure-pritunl-vpn-server-on-ubuntu/

* Данные для подключения:
    bastion_IP = 51.250.4.53
    someinternalhost_IP = 10.128.0.5

* Для использования сертификата от Let's Encrypt при подключении к админке pritunl, внёс имя `https://51-250-4-53.sslip.io/` в Settings -> Let's Encrypt Domain админки.
