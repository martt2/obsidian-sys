---
test: test
arm: aaa-bbb-ccc
abc: ok
---

```dataviewjs
const file = app.workspace.getActiveFile();
const yaml = app.metadataCache.getFileCache(file)?.frontmatter || {};
console.log(yaml.abc)
```


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
  - type: inlineJS
    code: "console.log(sys.main.arm)"
    args: {}

```