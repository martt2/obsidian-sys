---
name: new-file
tag:
  - aaa
  - bbb
---
```dataviewjs
arm = {}
dv.paragraph(`# Add Storage - @${conf.user}`)
```

---

Criar um **Storage**

**nome:** `INPUT[text(placeholder(nome)):name]`

**tags:** `INPUT[inlineList():tag]`

`BUTTON[btn-add]`

---

Ir para: `BUTTON[btn-go-main]`

```meta-bind-embed
[[sys/model/btn-go-main]]
```

```meta-bind-embed
[[sys/model/btn-add]]
```