
# Conf
---

**user:** `INPUT[text(placeholder(user)):user]`

`BUTTON[btn-reload]`

```meta-bind-button
label: reload
icon: ""
style: primary
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
id: btn-reload
hidden: true
actions:
  - type: inlineJS
    code: |-
      const {main} = await cJS()
      main.loadConf()
    args: {}

```

```meta-bind-embed
[[sys/model/meta-bind-embed/btn-goto]]
```
