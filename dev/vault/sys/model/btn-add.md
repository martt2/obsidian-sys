```dataviewjs
const arm = sys.main.arm()

arm.get().submit = ()=>{
	const data = dv.current()
	sys.main.cmd('add',{
		user: sys.conf.user,
		type: data.type,
		database: data.database,
		name: data.name,
		rule: data.rule,
		tag: data.tag,
	})
	.then(sys.main.load_conf)
	.then(()=>{
		arm.reset();
		new Notice(`${data.type} ${data.name} create`,5000);
	})
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
    code: "sys.main.arm().get().submit()"
    args: {}
```