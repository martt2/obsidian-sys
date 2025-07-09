---
name: test2
tag:
  - newuser
user: newuser
---
```dataviewjs
global.conf = dv.page("pages/conf");
dv.paragraph(`# Add Storage - @${conf.user}`)
```

---

Criar um **Storage**

**nome:** `INPUT[text(placeholder(nome)):name]`

**tags:** `INPUT[inlineList():tag]`

`BUTTON[btn-add]`

```meta-bind-button
label: add
icon: ""
style: primary
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
id: btn-add
hidden: true
actions:
  - type: updateMetadata
    bindTarget: user
    evaluate: true
    value: "conf.user"
  - type: sleep
    ms: 1000
  - type: command
    command: obsidian-shellcommands:shell-command-x8sh3o2t8h
  - type: input
    str: Criado novo Storage
  - type: open
    link: view/view.md
    newTab: false
```

```meta-bind-button
label: back
icon: ""
style: default
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
id: btn-back
hidden: true
actions:
  - type: open
    link: main.md
    newTab: false

```

```meta-bind-embed
[[sys/model/meta-bind-embed/btn-goto]]
```