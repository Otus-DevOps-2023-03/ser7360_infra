## ДЗ по модулю Основные сервисы Yandex Cloud ##
```
testapp_IP = 51.250.93.194
testapp_port = 9292
```

Установил и настроил yc CLI для работы с аккаунтом,
создадал хост с помощью CLI,
установил на нем ruby для работы приложения,
установил и запустил MongoDB,
задеплоил тестовое приложение, запустил и проверил его работу.
Все необходимые команды завернул в скрипты.
Создал скрипт для создания инстанса с уже запущенным приложением.

Инициализации инстанса:

1. Выполнить команду:

    yc compute instance create \
        --name reddit-app \
        --hostname reddit-app \
        --memory=4 \
        --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
        --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
        --metadata serial-port-enable=1 \
        --ssh-key ~/.ssh/id_ed25519.pub
    ```
2. Скопировать на созданную ВМ файлы:
    - ```install_ruby.sh```
    - ```install_mongodb.sh```
    - ```deploy.sh```
    - ```startup.sh```

3. Запустить скрипт ```startup.sh```



# ДЗ по модулю Знакомство с облачной инфраструктурой. Yandex.Cloud
bastion_IP = 158.160.35.13

someinternalhost_IP = 10.128.0.6

# Доп задание
VPN server admin panel: https://158.160.35.13.sslip.io

Для подключения к хосту без внешнего IP в одну команду необходимо использовать bastion как jump хост:

ssh -J nikita@bastion nikita@someinternalhost

Для подключения при помощи команды вида ssh someinternalhost из локальной консоли рабочего устройства, чтобы подключение выполнялось по алиасу someinternalhost, необходимо в файле ~/.ssh/config прописать:

Jump host
Host bastion
  HostName 158.160.35.13
  User nikita

Destination host
Host someinternalhost
    HostName 10.128.0.6
    ProxyJump bastion
