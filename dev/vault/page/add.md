---
arm: page-add
type: item
rule: study
database: main
name: test-item
tag:
  - aaa
  - bbb
---

# Add - @`$= sys.conf.user`

---

type: `INPUT[inlineSelect(
	option(item),
	option(database)
):type]`

```dataviewjs
const db_arr = sys.main.db_convert_path(sys.conf.database, "main")
const arr = []

for( i of db_arr ){
	arr.push( `option(${i.id}, ${i.path.join('/')})` )
}

dv.paragraph(`database: \`INPUT[inlineSelect(${arr.join(',')}):database]\``)

```

name: `INPUT[text(placeholder(name)):name]`

rule: `INPUT[inlineSelect(
	option(projects),
	option(study),
	option(source)
):rule]`

tag: `INPUT[inlineList():tag]`

`BUTTON[btn-add]`

---

Ir para: [[/main.md|main]]

```meta-bind-embed
[[sys/model/btn-add]]
```