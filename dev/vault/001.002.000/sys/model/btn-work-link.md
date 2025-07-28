```dataviewjs
arm.link = ()=>{
	const data = dv.current()
	main.cmd(`workspace-link ${data.id}`).then()
}
```

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