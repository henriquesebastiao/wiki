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

A sua chave privada nunca deve ser vista por ninguém, guarde ela a sete chaves. A chave que estou exibindo aqui foi criada apenas para fins de exemplo, nunca usarei ela.
