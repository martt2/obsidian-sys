```dataviewjs
const arm = sys.main.arm()

const promise = async ({ metadata }) => {
	const data = metadata.get();
	const name = data.f_alias || data.sys_name;

	if(data.sys_actived == true){
		new Notice(
			`work ${name} is activated`,
			5000
		);
		return
	};

	await sys.main.cmd('work-link', {
		uuid: data.sys_id,
		name: name
	});

	await sys.main.load.work();

	await metadata.set(e => {
		delete e.f_alias
		return {
			...e,
			sys_actived: true
		}
	});

	arm.reset();
	new Notice(
		`work ${name} activated`,
		5000
	);
}

arm.set_fn`work_link`((...arg) => promise(...arg).then())
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
      code: "sys.main.arm().get().arm.fn.work_link()"
      args: {}
    - type: sleep
      ms: 1000
  ```