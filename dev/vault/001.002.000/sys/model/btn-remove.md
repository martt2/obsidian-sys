```dataviewjs
arm.remove = ()=>{
	const data = dv.current()
	main.cmd(`storage-remove ${data.id}`).then()
}
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