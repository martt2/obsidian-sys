```dataviewjs
const arm = sys.main.arm()

const promise = async ({ metadata }) => {
	const data = metadata.get();

	await sys.main.cmd('control-add', {
		user: sys.conf.user,
		type: data.f_type,
		database: data.f_database,
		name: data.f_name,
		rule: data.f_rule,
		tag: data.f_tag,
	});

	await sys.main.load.database();

	await metadata.set(e => ({ sys_arm: e.arm }));

	arm.reset();
	new Notice(`${data.f_type} ${data.f_name} create`, 5000);
}

arm.set_fn`add`((...arg) => promise(...arg).then())
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
    code: "sys.main.arm().get().arm.fn.add()"
    args: {}
  - type: sleep
    ms: 1000
```