---
arm: page-conf
---

# Conf
---

port : `$= sys.conf.port` : `INPUT[text(placeholder(port)):port]`

user : `$= sys.conf.user` : `INPUT[text(placeholder(user)):user]`

`BUTTON[btn-reload]`

---

Ir para: [main]

```meta-bind-embed
[[sys/model/btn-reload]]
```
