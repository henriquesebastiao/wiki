# GPG - GNU Privacy Guard

O [GPG](https://gnupg.org/) é uma ferramenta de software livre que implementa o padrão OpenPGP definido pela [RFC4880](https://www.ietf.org/rfc/rfc4880.txt).
O GPG utiliza criptografia híbrida, implementando criptografia simétrica e assimétrica, assim podemos gerenciar nossos pares de chaves PGP com ele.

## Gerar par de chaves

Para gerar um par de chaves execute:

```shell
gpg --full-generate-key
```

Com isso um prompt será iniciado, e as seguintes informações serão solicitadas:

1. Informe o tipo de chave que deseja criar (o padrão é uma chave ECC para assinatura e criptografia).
2. Selecione o tipo de curva elíptica desejada (isso é relacionado ao algoritmo de criptografia que será utilizado).
3. Informe o tempo de expiração da chave (o padrão é nunca expirar).
4. Informe seu nome.
5. Informe seu email.
6. Insira um comentário.
7. Por fim insira a senha de criptografia da sua chave.

Ao fim desse procedimento você terá criado seu par de chaves (pública e privada) PGP.

### Listando as chaves privadas

Agora você pode listar suas chaves privadas com o comando:

```shell
gpg --list-secret-keys --keyid-format=long
```

Saída:

```text
[keyboxd]
---------
sec   ed25519/FA450D27B6396F17 2026-02-04 [SC]
      209D1917A8C9E0ECD46BE23CFA450D27B6396F17
uid                 [ultimate] Henrique Sebastião <exemplo@henriquesebastiao.com>
ssb   cv25519/EE3EAA9D0F316114 2026-02-04 [E]
```

Isso é um dump da sua chave, veja a baixo o que cada elemento significa:

- `sec` - significa que você tem a *secret key* desta chave no seu *keyring*,
se você tivesse apenas a chave pública esse valor seria `pub`.
- `ed25519` - algoritmo de criptografia usado.
- `209D1917A8C9E0ECD46BE23CFA450D27B6396F17` - é a *fingerprint* da chave.
- `FA450D27B6396F17` - é o ID da chave, ele representa os últimos 16 dígitos hexadecimais da *fingerprint* da chave.
- `2026-02-04` - data de criação da chave.
- `[SC]` - capacidades da chave.
    - `S` -> Sign (assinar coisas: commits, tags, arquivos, e-mails).
    - `C` -> Certify (assinar outras chaves, subchaves, uids).
- `uid` - Identidade associada à chave.
- `[ultimate]` - nível de confiança da chave.

Veja que `ssb cv25519/EE3EAA9D0F316114 2026-02-04 [E]` é uma sub chave de `FA450D27B6396F17` que tem a capacidade `[E]`
possibilitando criptografar mensagens e arquivos.

A sua chave privada nunca deve ser vista por ninguém, guarde ela a sete chaves.
A chave que estou exibindo aqui foi criada apenas para fins de exemplo, nunca usarei ela.

### Listando as chaves públicas

Você também pode listar as chaves públicas existentes no seu *keyring* com o comando:

```shell
gpg --list-keys
```

Saída:

```txt
[keyboxd]
---------
pub   ed25519 2026-02-04 [SC]
      209D1917A8C9E0ECD46BE23CFA450D27B6396F17
uid           [ultimate] Henrique Sebastião <exemplo@henriquesebastiao.com>
sub   cv25519 2026-02-04 [E]

pub   rsa4096 2026-01-23 [SC]
      9FB4E2C44F1F59049C24116C6F5C3CD702976E14
uid           [ultimate] Henrique Sebastião <contato@henriquesebastiao.com>
sub   rsa4096 2026-01-23 [E]
```

## Exibir a chave pública

Para exibir a chave pública do seu par de chaves execute:

```shell
gpg --armor --export <id-da-chave>
```

Vamos obter a chave pública da chave que criamos anteriormente:

```shell
$ gpg --armor --export FA450D27B6396F17
-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEaYMbzBYJKwYBBAHaRw8BAQdAxvlvXsuGdGa+ZMR0y/HBObfjDSxC7yJnA32l
ajB6zaK0M0hlbnJpcXVlIFNlYmFzdGnDo28gPGV4ZW1wbG9AaGVucmlxdWVzZWJh
c3RpYW8uY29tPoiQBBMWCgA4FiEEIJ0ZF6jJ4OzUa+I8+kUNJ7Y5bxcFAmmDG8wC
GwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ+kUNJ7Y5bxcoMQD7Bx0IUW3r
QhinP1NtP522vWGPzcslLvrNMIDhyhzL1k8BAP8hmo9/HeSbswQr7Ipy9H9XWdxP
u18HmUs7uQAPL/QBuDgEaYMbzBIKKwYBBAGXVQEFAQEHQI+us+ZLRD0ib8x9g7Xg
CvlCRBezFMXDBSHPoqiulS0MAwEIB4h4BBgWCgAgFiEEIJ0ZF6jJ4OzUa+I8+kUN
J7Y5bxcFAmmDG8wCGwwACgkQ+kUNJ7Y5bxeYgwEA7uwihlAEo1P93aEUnaA23dZH
pmdLKJZSM1eSwvp7EyMBAKqT3o1au7PSyK2N2aagVfDGSDb07LZpTuQ2fgJNq9UM
=N+ZI
-----END PGP PUBLIC KEY BLOCK-----
```

## Exibir a chave privada

Para exibir a chave privada do seu par de chaves execute:

```shell
gpg --armor --export <id-da-chave>
```

Digite a senha de criptografia da sua chave quando for solicitado.

Vamos obter a chave privada da chave que criamos anteriormente:

```shell
$ gpg --export-secret-keys --armor FA450D27B6396F17
-----BEGIN PGP PRIVATE KEY BLOCK-----

lIYEaYMbzBYJKwYBBAHaRw8BAQdAxvlvXsuGdGa+ZMR0y/HBObfjDSxC7yJnA32l
ajB6zaL+BwMC2c3aQ1edzAP/Z7QsgaHGwbneeb8Nw9CQblDf5MAB+gfztqD7lrgI
3m/ntFDGObmWjL389bOj7DvvKDm9ysfxfAG8sB4TqQhmsbp7HDXowLQzSGVucmlx
dWUgU2ViYXN0acOjbyA8ZXhlbXBsb0BoZW5yaXF1ZXNlYmFzdGlhby5jb20+iJAE
ExYKADgWIQQgnRkXqMng7NRr4jz6RQ0ntjlvFwUCaYMbzAIbAwULCQgHAgYVCgkI
CwIEFgIDAQIeAQIXgAAKCRD6RQ0ntjlvFygxAPsHHQhRbetCGKc/U20/nba9YY/N
yyUu+s0wgOHKHMvWTwEA/yGaj38d5JuzBCvsinL0f1dZ3E+7XweZSzu5AA8v9AGc
iwRpgxvMEgorBgEEAZdVAQUBAQdAj66z5ktEPSJvzH2DteAK+UJEF7MUxcMFIc+i
qK6VLQwDAQgH/gcDAgEg3QVTAjtU/83Hj+89xCdUDjsPlX4kdELzbQjiX9SyBJzH
mnn5/h4HoqfCfL9hZVYXigmqaerlUaZDMU1DjQ5b8+D5hgOv+gArfladBLSIeAQY
FgoAIBYhBCCdGReoyeDs1GviPPpFDSe2OW8XBQJpgxvMAhsMAAoJEPpFDSe2OW8X
mIMBAO7sIoZQBKNT/d2hFJ2gNt3WR6ZnSyiWUjNXksL6exMjAQCqk96NWruz0sit
jdmmoFXwxkg29Oy2aU7kNn4CTavVDA==
=ZDNU
-----END PGP PRIVATE KEY BLOCK-----
```

## Exportar a chave pública

Para exporta a chave pública execute o seguinte comando:

```shell
gpg --export --armor FA450D27B6396F17 > gpg-public-key.pub
```

Agora sua chave pública está salva no arquivo `gpg-public-key.pub`.

## Exportar a chave privada

Para exporta a chave privada execute o seguinte comando:

```shell
gpg --export-secret-keys --armor FA450D27B6396F17 > gpg-private-key
```

Agora sua chave privada está salva no arquivo `gpg-private-key`.

## Criptografando um arquivo com criptografia simétrica

Você pode criptografar arquivos com GPG por meio de criptografia simétrica,
sem precisar ter um par de chaves PGP. Na criptografia simétrica você precisa informar
uma senha de criptografia quando for criptografar e descriptografar os dados.

Para um exemplo vamos criar um arquivo de texto com a frase "Meu texto super secreto".

```shell
echo "Meu texto super secreto" > texto.txt
```

Verificamos que o arquivo foi criado:

```shell
$ cat texto.txt      
Meu texto super secreto
```

Vamos criptografar nosso arquivo com o comando:

```shell
gpg --symmetric texto.txt
```

Isso irá criar um segundo arquivo com a extensão `.gpg`, esse é o arquivo com o conteúdo do arquivo original criptografado, podemos tentar lelo com o comando `cat`:

```shell
$ cat texto.txt.gpg 
�
M�2D���A��S$+2������8�r&�i�[K;T�gn)&u�o��w␦����/2[���
���f5g4��x�'5�&?kk���W�H�o�tr��%
```

Vemos que o conteúdo do arquivo é ilegível, o que significa que a criptografia funcionou!

Podemos inspecionar que tipo de arquivo é esse com o comando `file`:

```shell
$ file texto.txt.gpg 
texto.txt.gpg: PGP symmetric key encrypted data - AES with 256-bit key salted & iterated - SHA512 .
```

Constatamos que é um arquivo contendo dados criptografados com criptografia simétrica PGP, exatamente o que esperávamos.

### Descriptografando o arquivo

Para descriptografar o arquivo que encriptamos anteriormente executamos o seguinte comando:

```shell
gpg --output texto-descriptografado.txt --decrypt texto.txt.gpg
```

Inserimos a senha de criptografia quando solicitada.

Isso irá salvar o conteúdo descriptografado no arquivo `texto-descriptografado.txt`.

Agora podemos ler o arquivo e ver que o conteúdo está visível:

```shell
$ cat texto-descriptografado.txt 
Meu texto super secreto
```

## Criptografando um arquivo com criptografia assimétrica

Alternativamente você também pode criptografar arquivos utilizando um par de chaves PGP,
neste método de criptografia você utiliza uma chave pública para criptografar os dados e
apenas é possível descriptografar os dados possuindo a chave privada respectiva a chave pública
utilizada para criptografar os dados.

Esse método é muito útil quando queremos enviar um arquivo de forma segura para alguém. A pessoa que irá receber
o arquivo pode nos enviar sua chave pública (que pode ser visível por qualquer um) e criptografamos o arquivo usando essa chave, assim podemos enviar o arquivo para a pessoa e apenas ela conseguirá descriptografar o arquivo
com sua chave privada.

Vamos supor que o email atrelado a chave pública da pessoa que irá receber o arquivo é o `exemplo@henriquesebastiao.com`, podemos criptografar o arquivo `texto.txt` que tínhamos anteriormente com o seguinte comando:

```shell
gpg --encrypt --recipient exemplo@henriquesebastiao.com texto.txt
```

O arquivo com os dados criptografados é o `texto.txt.gpg`, podemos tentar ler esse arquivo:

```shell
$ cat texto.txt.gpg 
�^�>��1a@�5w��Ej���-���4S������1�����n0��dv0�%�E.<�t��0z�%2K�XO�F|8��
�o�M
fE��J�?(<�殛�wl�Վ��%~..mݪ�1o�DR�TR�5��$p��%
```

Verificamos então que os dados estão criptografados.

### Descriptografando o arquivo

Para descriptografar um arquivo criptografado com a chave pública executamos o seguinte comando:

```shell
gpg --output texto-descriptografado.txt --decrypt texto.txt.gpg
```

Isso criará um arquivo chamado `texto-descriptografado.txt` contendo o conteúdo original descriptografado:

```shell
cat texto-descriptografado.txt             
Meu texto super secreto
```

Apesar de que nestes exemplos apenas criptografei arquivos de texto, é possível criptografar qualquer formato de arquivos com GPG.

## Importando chaves existentes

Para importar chaves GPG existentes, seja porque você trocou de computador ou por qualquer outro motivo,
basta executar o seguinte comando:

```gpg --import public.key```

Ou:

```gpg --import secret.key```
