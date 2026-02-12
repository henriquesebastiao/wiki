# Certificados SSL

## Gerando um certificado auto assinado

Para gerar um certificado auto assinado no mikrotik execute:

```txt
/certificate/add name=self_signed common-name=self_signed key-size=2048
/certificate/sign self_signed
/ip/service/set www-ssl certificate=self_signed disabled=no
```

Lembre-se de ter a porta HTTPS liberada em seu firewall.