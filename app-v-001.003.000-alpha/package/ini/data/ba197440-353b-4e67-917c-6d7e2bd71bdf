---
sys_arm: main
---
```dataviewjs
sys.main.api.mode().view()
```

# Home - @`$=sys.conf.user`

---

```dataviewjs
const db_arr = sys.main.db.convert_path(sys.database, "main")
const db_arr_md = []

for (const i of db_arr) {
	db_arr_md.push(`- [[ view/${i.id}/main|${i.path.join('/')} ]]`)
}

sys.main.md(dv).flexbox(
`
## 🗃️ Storages
Gerenciador de **storages**
[[page/add|add]]
`,
`
## ⚙️ Config
Configurações
[[page/conf|conf]]
`,
`
## 📚 Help
Ajuda para usar o sistema
[[page/help|help]]
`
)

sys.main.md(dv).flexbox(
`
## 📊 view
Vizulaização dos dados
${db_arr_md.join('\n')}
`
)
```