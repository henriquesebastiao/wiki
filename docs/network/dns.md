# *Domain Name System* (DNS)

O DNS funciona como uma lista telefônica para a internet, com ele podemos descobrir qual é o número IP
de determinado nome de domínio.

Use o seguinte comando para resolver o endereço do domínio `henriquesebastiao.com`:

```txt
$ dig henriquesebastiao.com 

; <<>> DiG 9.20.18 <<>> henriquesebastiao.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 59685
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;henriquesebastiao.com.		IN	A

;; ANSWER SECTION:
henriquesebastiao.com.	300	IN	A	104.21.35.157
henriquesebastiao.com.	300	IN	A	172.67.177.5

;; Query time: 57 msec
;; SERVER: 100.100.100.100#53(100.100.100.100) (UDP)
;; WHEN: Thu Feb 19 23:36:31 -04 2026
;; MSG SIZE  rcvd: 82
```

A seção `ANSWER SECTION` retorna os endereços obtido para este domínio.