```dataviewjs
const arm = sys.main.arm()

const promise = async ({ metadata }) => {
	const data = metadata.get();

	await sys.main.cmd('control-remove', {
		uuid: data.sys_id,
		type: data.sys_type,
		database: data.sys_database,
	});

	await sys.main.load.database();

	arm.reset();
	new Notice(`${data.sys_type} ${data.sys_name} remove`, 5000);
}

arm.set_fn`remove`((...arg) => promise(...arg).then())
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
      code: "sys.main.arm().get().arm.fn.remove()"
      args: {}
    - type: open
      link: home.md
      newTab: false
    - type: sleep
      ms: 1000
  ```