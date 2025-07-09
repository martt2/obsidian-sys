# Main
---

```dataviewjs
const {main} = await cJS()

const btn = {
	comp: '`BUTTON[btn-view, btn-add-storage]`',
	help: '`BUTTON[btn-help]`'
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
`,
`
## 📚 Help
Ajuda para usar o sistema
${btn.help}
`
)
```

```meta-bind-button
label: view
icon: ""
style: default
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
id: btn-view
hidden: true
actions:
  - type: open
    link: view/view.md
    newTab: false

```

```meta-bind-button
label: add-storage
icon: ""
style: default
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
id: btn-add-storage
hidden: true
actions:
  - type: open
    link: form/add-storage.md
    newTab: false

```

```meta-bind-button
label: help
icon: ""
style: default
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
id: btn-help
hidden: true
actions:
  - type: open
    link: help.md
    newTab: false

```