```dataviewjs
const arm = sys.main.arm()

const promise = async ({ metadata }) => {
	const data = metadata.get();

	await metadata.set(e => {
		e.sys_database = e.f_database;
		delete e.f_database;
		return e
	});

	await sys.main.cmd('control-db-change', {
		uuid: data.sys_id,
		type: data.sys_type,
		database: data.sys_database,
		new_database: data.f_database,
	});

	await sys.main.load.database();

	arm.reset();
	new Notice(
		`${data.sys_type} ${data.sys_name} change database to ${data.f_database}`,
		5000
	);
}

arm.set_fn`change_database`((...arg) => promise(...arg).then())
```

```meta-bind-button
  label: change database
  id: btn-change-database
  hidden: true
  icon: ""
  style: primary
  class: ""
  cssStyle: ""
  backgroundImage: ""
  tooltip: ""
  actions:
    - type: inlineJS
      code: "sys.main.arm().get().arm.fn.change_database()"
      args: {}
    - type: open
      link: home.md
      newTab: false
    - type: sleep
      ms: 1000
  ```