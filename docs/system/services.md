# Serviços

## Quais portas estão sendo expostas

Você pode verificar quais portas estão sendo expostas pela sua máquina usando o comando:

```shell
sudo ss -tulpn
```

Isso exibirá algo como o seguinte, onde na coluna `Process` você pode conferir qual processo está rodando na porta que procura.

```txt
Netid                      State                       Recv-Q                      Send-Q                                                                   Local Address:Port                                              Peer Address:Port                      Process                                                    
udp                        UNCONN                      0                           0                                                                              0.0.0.0:41641                                                  0.0.0.0:*                          users:(("tailscaled",pid=632,fd=19))                      
udp                        UNCONN                      0                           0                                                                           172.17.0.1:59218                                                  0.0.0.0:*                          users:(("python3",pid=5088,fd=14))                        
udp                        UNCONN                      0                           0                                                                         100.78.222.1:51894                                                  0.0.0.0:*                          users:(("python3",pid=5088,fd=11))                        
udp                        UNCONN                      0                           0                                                                         172.16.0.253:35834                                                  0.0.0.0:*                          users:(("python3",pid=5088,fd=8))                         
udp                        UNCONN                      0                           0                                                                           172.17.0.1:3702                                                   0.0.0.0:*                          users:(("python3",pid=5088,fd=15))                        
udp                        UNCONN                      0                           0                                                                      239.255.255.250:3702                                                   0.0.0.0:*                          users:(("python3",pid=5088,fd=13))                        
udp                        UNCONN                      0                           0                                                                         100.78.222.1:3702                                                   0.0.0.0:*                          users:(("python3",pid=5088,fd=12))                        
udp                        UNCONN                      0                           0                                                                      239.255.255.250:3702                                                   0.0.0.0:*                          users:(("python3",pid=5088,fd=10))                        
udp                        UNCONN                      0                           0                                                                         172.16.0.253:3702                                                   0.0.0.0:*                          users:(("python3",pid=5088,fd=9))                         
udp                        UNCONN                      0                           0                                                                      239.255.255.250:3702                                                   0.0.0.0:*                          users:(("python3",pid=5088,fd=7))                         
udp                        UNCONN                      0                           0                                                                                 [::]:41641                                                     [::]:*                          users:(("tailscaled",pid=632,fd=18))                      
udp                        UNCONN                      0                           0                                                [fe80::98b1:5b7:1be5:e909]%tailscale0:3702                                                      [::]:*                          users:(("python3",pid=5088,fd=21))                        
udp                        UNCONN                      0                           0                                                                 [ff02::c]%tailscale0:3702                                                      [::]:*                          users:(("python3",pid=5088,fd=19))                        
udp                        UNCONN                      0                           0                                                   [fe80::9ba7:b255:5fcb:8d80]%enp2s0:3702                                                      [::]:*                          users:(("python3",pid=5088,fd=18))                        
udp                        UNCONN                      0                           0                                                                     [ff02::c]%enp2s0:3702                                                      [::]:*                          users:(("python3",pid=5088,fd=16))                        
udp                        UNCONN                      0                           0                                                [fe80::98b1:5b7:1be5:e909]%tailscale0:37008                                                     [::]:*                          users:(("python3",pid=5088,fd=20))                        
udp                        UNCONN                      0                           0                                                   [fe80::9ba7:b255:5fcb:8d80]%enp2s0:54727                                                     [::]:*                          users:(("python3",pid=5088,fd=17))                        
tcp                        LISTEN                      0                           5                                                                            127.0.0.1:8000                                                   0.0.0.0:*                          users:(("mkdocs",pid=6580,fd=5))                          
tcp                        LISTEN                      0                           4096                                                                         127.0.0.1:33325                                                  0.0.0.0:*                          users:(("containerd",pid=643,fd=14))                      
tcp                        LISTEN                      0                           4096                                                                      100.78.222.1:41439                                                  0.0.0.0:*                          users:(("tailscaled",pid=632,fd=25))                      
tcp                        LISTEN                      0                           4096                                                       [fd7a:115c:a1e0::fc36:de01]:38967                                                     [::]:*                          users:(("tailscaled",pid=632,fd=26))
```

Caso queira procurar o que está rodando em uma porta específica você pode filtrar o *output* com o comando `grep`, vamos por exemplo procurar o que está sendo executado na porta 8000:

```shell
$ sudo ss -tulpn | grep :8000
tcp   LISTEN 0      5                                  127.0.0.1:8000       0.0.0.0:*    users:(("mkdocs",pid=10688,fd=5))
```

Assim podemos ver que estou executando o `mkdocs` na porta 8000.