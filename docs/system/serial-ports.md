# Portas Seriais

## Como permitir acesso a portas seriais

Quando você não tiver permissões para acessar um dispositivo conectado a uma porta serial, como por exemplo ao tentar gravar um *firmware* em um chip, basta executar o seguinte comando no terminal linux:

```shell
sudo chmod 666 /dev/ttyACM0
```

Neste exemplo a porta está representada pelo caminho `/dev/ttyACM0`, altere este caminho caso seja diferente para seu caso de uso.

O comando `sudo chmod 666 /dev/ttyACM0` altera as permissões do dispositivo de porta serial para permitir que qualquer usuário do sistema leia e escreva nele, já que o número 666 concede permissões de leitura e escrita para dono, grupo e outros; o sudo é necessário porque se trata de um arquivo do sistema, e isso resolve o erro de “Permission denied” ao acessar a porta (como com Arduino ou ESP32).