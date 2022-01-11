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

## Лекция 6. Деплой тестового приложения

Скрипты install_ruby.sh, install_mongodb.sh и deploy.sh находятся в подпапке HW6

testapp_IP = 62.84.126.44
testapp_port = 9292

### Дополнительное задание:

Файл startup-script.yaml, который используется при созжании хоста через cli, расположен в подпапке HW6.
Команда имеет следующий вид:
`yc compute instance create \
    --name reddit-app \
    --hostname reddit-app \
    --memory=4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \ --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
    --metadata serial-port-enable=1 \
    --metadata-from-file user-data=/PATH_TO_LOCAL_REPO/kirdyashkindi_infra/HW6/startup-script.yaml`, где:

PATH_TO_LOCAL_REPO - путь к скачанному репозиторию.

## Лекция 7. Сборка образов VM при помощи Packer

- Создан файл ubuntu16.json для сборки образа ВМ с установленными mongoDB и Ruby

- Параметры folder_id, source_image_family, service_account_key_file задаются через переменные, указанные в файле variables.json

### Построение bake-образа

- Создан файл immutable.json, в который включен скрипт установки зависимостей приложения, копирования unit файла и включения службы сервера puma, что позволяет автоматически запустить приложение при включении ВМ.

### Автоматизация создания ВМ

- Сделан скрипт create-reddit-vm.sh, в котором передаются все необходимые для создания ВМ параметры.
