```dataviewjs
arm.unlink = ()=>{
	const data = dv.current()
	main.cmd('workspace-unlink',{
		uuid: data.id,
	}).then()
}
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