```dataviewjs
const arm = sys.main.arm()

const promise = async ({ metadata }) => {
	const data = metadata.get();
	const name = sys.work[data.sys_id];

	if(data.sys_actived == false){
		new Notice(
			`work ${name} is disactivated`,
			5000
		);
		return
	};

	await sys.main.cmd('work-unlink', {
		uuid: data.sys_id,
	});

	await sys.main.load.work();

	await metadata.set(e => ({
		...e,
		sys_actived: false
	}));

	arm.reset();
	new Notice(
		`work ${name} disactivated`,
		5000
	);
}

arm.set_fn`work_unlink`((...arg) => promise(...arg).then())
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
      code: "sys.main.arm().get().arm.fn.work_unlink()"
      args: {}
    - type: sleep
      ms: 1000
  ```