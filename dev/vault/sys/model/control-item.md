```dataviewjs
sys.arm = {}
sys.arm.data = dv.current()
```

# `$= sys.arm.data.name`

## control-item

---

database: main

`INPUT[text:database]` `BUTTON[btn-change-database]`

work-alias : `INPUT[text:work-alias]`

work: `BUTTON[btn-link]` `BUTTON[btn-unlink]`

---

remover : `BUTTON[btn-remove]`

---

Ir para [main]

```meta-bind-embed
[[sys/model/btn-link]]
```

```meta-bind-embed
[[sys/model/btn-unlink]]
```

```meta-bind-embed
[[sys/model/btn-remove]]
```

```meta-bind-embed
[[sys/model/btn-change-database]]
```