### Work
Sessão responsavel pelo **workspace** do **storage**

**alias :** `INPUT[text:work-alias]` `BUTTON[btn-work-link]` `BUTTON[btn-work-unlink]`

---

Remover o storage: `BUTTON[btn-remove]`

```meta-bind-button
  label: link
  id: btn-work-link
  hidden: true
  icon: ""
  style: default
  class: ""
  cssStyle: ""
  backgroundImage: ""
  tooltip: ""
  actions:
    - type: command
      command: obsidian-shellcommands:shell-command-2zxct2vnks
  ```

```meta-bind-button
  label: unlink
  id: btn-work-unlink
  hidden: true
  icon: ""
  style: default
  class: ""
  cssStyle: ""
  backgroundImage: ""
  tooltip: ""
  actions:
    - type: command
      command: obsidian-shellcommands:shell-command-krdt4m1npw
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
      link: main.md
      newTab: false

  ```