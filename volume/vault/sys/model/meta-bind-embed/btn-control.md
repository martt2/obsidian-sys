## Controle

`BUTTON[btn-work, btn-remove]`

```meta-bind-button
  label: work
  id: btn-work
  hidden: true
  icon: ""
  style: default
  class: ""
  cssStyle: ""
  backgroundImage: ""
  tooltip: ""
  actions:
    - type: inlineJS
      code: console.log("work")
      args: {}
  ```
  
  ```meta-bind-button
  label: remove
  id: btn-remove
  target: this
  hidden: true
  icon: ""
  style: destructive
  class: ""
  cssStyle: ""
  backgroundImage: ""
  tooltip: ""
  actions:
    - type: command
      command: obsidian-shellcommands:shell-command-nkb0qej408
    - type: open
      link: view/view.md
      newTab: false

  ```