# Comparar arquivos com hash

Útil para verificar se dois arquivos são idênticos, especialmente binários.

## Comandos

Gera o hash de um ou mais arquivos:
```bash
md5sum arquivo1.txt arquivo2.txt
sha256sum arquivo1.txt arquivo2.txt
```

Se os hashes forem iguais, os arquivos são idênticos. Prefira `sha256sum` por ser mais seguro.

Comparação direta no terminal:
```bash
[ "$(sha256sum arquivo1 | awk '{print $1}')" = "$(sha256sum arquivo2 | awk '{print $1}')" ] \
  && echo "Iguais" || echo "Diferentes"
```

## Quando usar `diff` no lugar

Para arquivos de **texto**, o `diff` é mais útil pois mostra exatamente o que mudou:
```bash
diff arquivo1.txt arquivo2.txt
```

Para **binários**, use sempre hash.