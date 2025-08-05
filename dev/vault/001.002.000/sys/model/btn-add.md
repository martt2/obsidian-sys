```dataviewjs
arm.submit = ()=>{
	const data = dv.current()
	main.cmd('storage-add',{
		user: conf.user,
		name: data.name,
		tag: data.tag,
	}).then()
}
```

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
  - type: inlineJS
    code: "arm.submit()"
    args: {}
  - type: input
    str: Criado novo Storage
  - type: sleep
    ms: 1000
  - type: open
    link: view/view.md
    newTab: false
```