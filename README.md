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
