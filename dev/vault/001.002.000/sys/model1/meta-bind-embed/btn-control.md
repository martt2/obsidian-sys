```dataviewjs
console.log('test')
arm.link = ()=>{
	const data = dv.current()
	main.cmd(`workspace-link ${data.id}`).then()
}
arm.unlink = ()=>{
	const data = dv.current()
	main.cmd(`workspace-unlink ${data.id}`).then()
}
arm.remove = ()=>{
	const data = dv.current()
	main.cmd(`storage-remove ${data.id}`)
}
```

### Work
Sessão responsável pelo **workspace** do **storage**

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
    - type: inlineJS
      code: "arm.link()"
      args: {}
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
    - type: inlineJS
      code: "arm.unlink()"
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
    - type: inlineJS
      code: "arm.remove()"
      args: {}
    - type: open
      link: main.md
      newTab: false

  ```