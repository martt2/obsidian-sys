```dataviewjs
dv.paragraph(`# Main - @${conf.user}`)
```

---

```dataviewjs

const btn = {
	comp: '`BUTTON[btn-go-view, btn-go-add-storage]`',
	help: '`BUTTON[btn-go-help]`',
	conf: '`BUTTON[btn-go-conf]`',
}

main.flexbox(dv,
`
## 🗃️ Storages
Gerenciador dos **storages**
${btn.comp}
`,
`
## ⚙️ Config
Configurações
${btn.conf}
`,
`
## 📚 Help
Ajuda para usar o sistema
${btn.help}
`
)
```

```meta-bind-embed
[[sys/model/btn-go-view]]
```

```meta-bind-embed
[[sys/model/btn-go-add-storage]]
```

```meta-bind-embed
[[sys/model/btn-go-help]]
```

```meta-bind-embed
[[sys/model/btn-go-conf]]
```