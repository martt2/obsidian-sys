```dataviewjs
sys.arm = {}
sys.arm.data = dv.current()
```

# `$= sys.arm.data.name`

## control-database

---

database: main

`INPUT[text:database]` `BUTTON[btn-change-database]`

```dataviewjs
dv.paragraph(`link: [[view/${sys.arm.data.id}/main|database]]`)
```

---

remover: `BUTTON[btn-remove]`

---

Ir para [main]

```meta-bind-embed
[[sys/model/btn-remove]]
```

```meta-bind-embed
[[sys/model/btn-change-database]]
```