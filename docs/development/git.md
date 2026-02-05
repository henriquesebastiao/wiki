# Git

Git é uma ferramenta para versionamento de código.

## Configurar chave GPG

Configure qual chave GPG será usada para assinar commits com o seguinte comando:

```shell
git config --global user.signingkey <id-da-chave>
```

## Configurar o git para assinar todos os commits e tags por padrão

```shell
git config --global commit.gpgsign true
git config --global tag.gpgSign true
```
