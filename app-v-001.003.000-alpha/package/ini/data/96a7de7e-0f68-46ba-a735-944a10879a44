```dataviewjs
const arm = sys.main.arm()
const { metadata } = arm.get()
const data = metadata.get()
const db_name = sys.database[data.sys_database].name

sys.main.api.mode().view()

dv.paragraph(`

# ${data.sys_name}

## control-item

- database: [[/view/${data.sys_database}/main|${db_name}]]

---

alias : \`INPUT[text:f_alias]\`

work: \`BUTTON[btn-work-link]\` \`BUTTON[btn-work-unlink]\`

---

${sys.main.md().select_database('f_database')} \`BUTTON[btn-change-database]\`

\`INPUT[text:f_name]\` \`BUTTON[btn-change-name]\`

rule: \`INPUT[inlineSelect(
	option(projects),
	option(study),
	option(source)
):sys_rule]\`

tag: \`INPUT[inlineList():sys_tag]\`

remover : \`BUTTON[btn-remove]\`

---

Ir para [[/home|home]]

`)


```

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
[[sys/model/btn-change-database]]
```

```meta-bind-embed
[[sys/model/btn-change-name]]
```