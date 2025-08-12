
# Add - @`$= conf.user`

---

type: `INPUT[inlineSelect(
	option(item),
	option(database)
):type]`

database: main

name: `INPUT[text(placeholder(name)):name]`

rule: `INPUT[inlineSelect(
	option(projects),
	option(study),
	option(source)
):rule]`

tag: `INPUT[inlineList():tag]`

`BUTTON[btn-add]`

---

Ir para: [main]

```meta-bind-embed
[[sys/model/btn-add]]
```