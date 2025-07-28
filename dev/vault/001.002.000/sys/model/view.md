```dataviewjs
const name = dv.current().name
arm={}
dv.paragraph(`# ${name}`)
```

### Work
Sessão responsável pelo **workspace** do **storage**

**alias :** `INPUT[text:work-alias]` `BUTTON[btn-work-link]` `BUTTON[btn-work-unlink]`

---

Remover o storage: `BUTTON[btn-remove]`

---

Ir para `BUTTON[btn-go-main]`

```meta-bind-embed
[[sys/model/btn-work-link]]
```

```meta-bind-embed
[[sys/model/btn-work-unlink]]
```

```meta-bind-embed
[[sys/model/btn-remove]]
```

```meta-bind-embed
[[sys/model/btn-go-main]]
```