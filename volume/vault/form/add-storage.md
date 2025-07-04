---
tag: []
name: ""
---
# Add Storage
---
Criar um **Storage**

**user:** user

**nome:** `INPUT[text(placeholder(nome)):name]`

**tags:** `INPUT[inlineList():tag]`

`BUTTON[btn-add,btn-back]`

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
  - type: command
    command: ""

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
  - type: command
    command: ""

```