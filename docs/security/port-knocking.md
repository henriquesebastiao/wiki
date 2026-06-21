# Port Knocking

Em redes de computadores, o *port knocking* é um método para abrir portas externamente em um firewall,
gerando uma tentativa de conexão em um conjunto de portas fechadas predefinidas.
Assim que uma sequência correta de tentativas de conexão é recebida,
as regras do firewall são modificadas dinamicamente para permitir que o host que enviou as
tentativas de conexão se conecte por meio de portas específicas.

## Instalando o `knockd`

No linux, para utilizar o *port knocking*, você pode utilizar a ferramenta `knockd`:

```bash
sudo pacman -S knockd
```

## Utilizando

Vamos supor que você tem um VPS rodando um Ubuntu Server na nuvem e quer retringir o acesso do servidor
apenas à máquinas conectadas a uma determinada VPN que também está configurada no servidor, se por um acaso você
precise fazer um acesso de emergência ao servidor para alguma eventual manutenção, como o faria se o aceso é bloqueado pelo firewall
a outros endereços IP. Você poderia utilizar o *port knocking*.

Primeiro, você precisa configurar seu firewall para ouvir as portas que serão utilizadas para o *port knocking*:

```bash
sudo ufw allow 7000/tcp
sudo ufw allow 8000/tcp
sudo ufw allow 9000/tcp
```
Em seguida, você precisa configurar o `knockd` para ouvir as portas e executar um comando para abrir a porta de acesso ao servidor:

```bash
[options]
    UseSyslog
[openSSH]
    sequence    = 7000,8000,9000
    seq_timeout = 5
    command     = ufw allow from %IP% to any port 22
    tcpflags    = syn
```

Com isso, quando você fizer uma tentativa de conexão para as portas 7000, 8000 e 9000 na sequência correta, o `knockd` irá executar o comando para abrir a porta 22 para o endereço IP que fez as tentativas de conexão.
Para fazer as tentativas de conexão, você pode utilizar o comando `knock`:

```bash
knock <IP_DO_SERVIDOR> 7000 8000 9000
```

Após isso, você poderá acessar o servidor via SSH normalmente, e o acesso será permitido apenas para o endereço IP que fez as tentativas de conexão.

Você pode usar esta técnica para proteger outros serviços além do SSH, e também em outros tipos de dispositivos de rede além de servidores, como roteadores e firewalls.