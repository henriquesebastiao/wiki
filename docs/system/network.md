# Redes

## IPv6

### Como desativar o suporte ao IPv6 no Linux

```shell
sudo nano /etc/sysctl.conf
```
Adicione o seguinte conteúdo no final do arquivo:

```text
net.ipv6.conf.all.disable_ipv6 = 1 
```

Agora execute o comando abaixo para aplicar as alterações:

```shell
sudo sysctl -p
```