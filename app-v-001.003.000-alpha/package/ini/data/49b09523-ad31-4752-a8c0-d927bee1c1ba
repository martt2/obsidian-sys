---
{}
---
```dataviewjs
sys.main.api.mode().view()
```

# Add - @`$= sys.conf.user`

---

type: `INPUT[inlineSelect(
	option(item),
	option(database)
):f_type]`

database: `$= sys.main.md().select_database('f_database')`

name: `INPUT[text(placeholder(name)):f_name]`

rule: `INPUT[inlineSelect(
	option(projects),
	option(study),
	option(source)
):f_rule]`

tag: `INPUT[inlineList():f_tag]`

`BUTTON[btn-add]`

---

Ir para: [[/home|home]]

```meta-bind-embed
[[sys/model/btn-add]]
```