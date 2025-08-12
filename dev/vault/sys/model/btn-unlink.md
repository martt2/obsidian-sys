```dataviewjs
sys.arm.unlink = ()=>{
	const data = dv.current()
	main.cmd('workspace-unlink',{
		uuid: data.id,
	}).then()
}
```

```meta-bind-button
  label: unlink
  id: btn-unlink
  hidden: true
  icon: ""
  style: default
  class: ""
  cssStyle: ""
  backgroundImage: ""
  tooltip: ""
  actions:
    - type: inlineJS
      code: "sys.arm.unlink()"
      args: {}
  ```