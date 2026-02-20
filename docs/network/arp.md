# *Address Resolution Protocol* (ARP)

De forma resumida o ARP é o protocolo responsável por identificar quais placas de rede (endereços MAC)
tem determinados endereços IP.

Leia mais sobre o protocolo ARP:

- [Address Resolution Protocol - Wikipedia](https://en.wikipedia.org/wiki/Address_Resolution_Protocol)
- [Address Resolution Protocol (ARP) - Wireshark](https://wiki.wireshark.org/AddressResolutionProtocol)

Para ver a tabela ARP local do seu computador execute:

```txt
$ arp
Address                  HWtype  HWaddress           Flags Mask            Iface
_gateway                 ether   48:8f:5a:**:**:**   C                     enp2s0
server.local             ether   6c:0b:84:**:**:**   C                     enp2s0
```
