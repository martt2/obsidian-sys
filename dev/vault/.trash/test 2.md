

test

---

```meta-bind-button
label: This is a button
icon: ""
style: default
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
id: ""
hidden: false
actions:
  - type: regexpReplaceInNote
    regexp: ^---\n[\s\S]*?\n---
    replacement: ""
    regexpFlags: ""

```

```dataviewjs
//const v_ul = dv.el("ul", "", { container: dv.container });
//dv.el("li", "aaa", { container: v_ul });
//dv.el("li", "bbb", { container: v_ul });
//const v_ccc = dv.el("li", "ccc", { container: v_ul });
//const v_ccc_ul = dv.el("ul", "", { container: v_ccc });
//dv.el("li", "c1", { container: v_ccc_ul });
//dv.el("li", "c2", { container: v_ccc_ul });
//dv.el("li", "c3", { container: v_ccc_ul });
```

- ok
- ok
	- a
	- b
	- c
- ok

```dataviewjs

const container = dv.container
container.style = ""

// Cria o <ul> principal com a classe "has-list-bullet"
const div = dv.el("ul", "", {
	container: dv.el("div", "", { cls: "el-ul", container: container }),
	cls: "has-list-bullet"
});

// Primeiro <li>: simples
dv.el("li", "aaa", { container: div });

// Segundo <li>: contém colapsador e lista aninhada
const li_1 = dv.el("li", "", {
	container: div,
	cls: ""
});

// Adiciona bullet e colapsador SVG manualmente
li_1.innerHTML = `
  <span class="list-bullet"></span>
  <span class="list-collapse-indicator collapse-indicator collapse-icon">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
      stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
      class="svg-icon right-triangle">
      <path d="M3 8L12 17L21 8"></path>
    </svg>
  </span>ok
`;

// Lista aninhada
const ul_1 = dv.el("ul", "", {
	container: li_1,
	cls: "has-list-bullet"
});

["a", "b", "c"].forEach(item => {
	dv.el("li", item, { container: ul_1 });
});

// Terceiro <li>: simples
dv.el("li", "ok", { container: div });

```