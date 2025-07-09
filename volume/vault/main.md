```dataviewjs
global.conf = dv.page("pages/conf");
dv.paragraph(`# Main - @${conf.user}`)

```

---

```dataviewjs
const {main} = await cJS()

const btn = {
	comp: '`BUTTON[btn-view, btn-add-storage]`',
	help: '`BUTTON[btn-help]`',
	conf: '`BUTTON[btn-conf]`',
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
    link: pages/form/add-storage.md
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
    link: pages/help.md
    newTab: false

```

```meta-bind-button
label: conf
icon: ""
style: default
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
id: btn-conf
hidden: true
actions:
  - type: open
    link: pages/conf.md
    newTab: false

```