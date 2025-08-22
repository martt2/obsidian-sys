class main {
    async invoke() {
        console.log('run invoke')
        await this.start()
    }

    async start() {
        // const dv = app.plugins.plugins.dataview.api
        // global.conf = dv.page("pages/conf");
        Object.defineProperty(globalThis, "sys", {
            value: {},
            writable: false,
            configurable: false,
            enumerable: true
        })

        await this.load.conf()
        await this.load.database()
        await this.load.work()
        sys.main = this
        sys.arm = {}
        console.log('script start')
    }

    load = {
        async conf() {
            sys.conf = await app.vault.readJson('sys/conf/conf.json')
            console.log('conf load')
        },

        async database() {
            sys.database = await app.vault.readJson('sys/conf/database.json')
            console.log('conf database')
        },

        async work() {
            sys.work = await app.vault.readJson('sys/conf/work.json')
            console.log('conf work')
        }
    }

    async cmd(cmd = '', data = {}) {
        return fetch(`http://localhost:${sys.conf.port}/cmd`, {
            method: "POST",
            body: JSON.stringify({ cmd, data })
        })
    }

    api = {
        mode() {

            const leaf = app.workspace.activeLeaf;
            const set_mode = (mode) => {
                leaf.setViewState({
                    ...leaf.getViewState(),
                    state: { ...leaf.view.getState(), mode: mode }
                });
            }

            return {
                edit: () => set_mode("source"),
                view: () => set_mode("preview")
            }
        },

        metadata(path) {
            const file = app.vault.getAbstractFileByPath(path);

            if (!file) throw new Error(`file not found: ${path}`);

            const modify = async (fn) => {
                const file_str = await app.vault.read(file);
                const [data_str, content] = file_str.startsWith('---') ?
                    file_str.match(/^---\n([\s\S]*?)\n---\n?([\s\S]*)$/).slice(1) :
                    ['', file_str]
                const data = customJS.obsidian.parseYaml(data_str) || {};
                const new_data = { ...fn(data) };
                const new_data_str = customJS.obsidian.stringifyYaml(new_data);
                const new_file_str = `---\n${new_data_str.trim()}\n---\n${content.trim()}`;
                await app.vault.modify(file, new_file_str);
            }

            return {
                get: () => ({ ...app.metadataCache.getFileCache(file).frontmatter }),
                set: modify,
            }
        }
    }

    db = {
        convert: (db = {}, idStart = "") => {
            const recursive = ({ id = "", name = "", data = [] }) => {
                if (data.length > 0) {
                    const res = []

                    for (const el of data) {
                        const el1 = recursive(db[el])
                        res.push(...el1)
                    }

                    return [name, res]
                } else {
                    return [name]
                }
            }

            return recursive(db[idStart])
        },

        convert_path: (db = {}, idStart = "") => {
            const res = [];

            const recursive = ({ id = "", name = "", data = [] }, path = []) => {
                const obj = { path: [...path, name], id }
                res.push(obj)

                if (data.length > 0) {

                    for (const el of data) {
                        const newPath = [...path, name]
                        recursive(db[el], newPath)
                    }

                }
            }

            recursive(db[idStart])
            return res.filter(el => el)
        }
    }

    md = (dv) => {
        const recursive = (arr, parent) => {
            const svg = `
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                class="svg-icon right-triangle">
                <path d="M3 8L12 17L21 8"></path>
            </svg>
            `
            parent = typeof parent === "undefined" ? (() => {
                const container = dv.container
                container.style = ""
                const div = dv.el("div", "", { cls: "el-ul", container: container })
                const ul = dv.el("ul", "", { container: div, cls: "has-list-bullet" });
                return ul
            })() : parent

            let back;

            for (const el of arr) {
                if (typeof el === "string") {
                    const li = dv.el("li", "", { container: parent })
                    const span = dv.el("span", "", {
                        cls: "list-bullet"
                    })
                    li.append(span, dv.paragraph(el))
                    back = li;
                } else if (Array.isArray(el)) {
                    const span = dv.el("span", "", {
                        cls: "list-collapse-indicator collapse-indicator collapse-icon"
                    })
                    span.innerHTML = svg
                    back.prepend(span)
                    const ul = dv.el("ul", "", {
                        container: back,
                        cls: "has-list-bullet"
                    })
                    recursive(el, ul)
                }
            }
        }

        return {
            list: recursive,

            flexbox: (...arr) => {
                dv.container.className += "sys-flexbox-container"
                const div = dv.el("div", "", {
                    container: dv.container
                })
                const ul = dv.el("ul", "", {
                    container: div,
                    cls: "sys-flexbox-ul"
                })

                ul.innerText = "";

                arr.forEach(el => dv.el("li", el, {
                    container: ul,
                    cls: "sys-flexbox-li"
                }))

                return dv.container
            },

            select_database: (v = "") => {
                const db_arr = sys.main.db.convert_path(sys.database, "main")
                const arr = []

                for (const i of db_arr) {
                    arr.push(`option(${i.id}, ${i.path.join('/')})`)
                }

                const res = `\`INPUT[inlineSelect(${arr.join(',')}):${v}]\``

                if (typeof dv != 'undefined') {
                    dv.paragraph(res)
                }

                return res
            }
        }
    }

    arm = () => {
        const { path } = app.workspace.getActiveFile();
        const metadata = sys.main.api.metadata(path)
        const m = metadata.get()
        const key = m.sys_id || m.sys_arm || '_';

        if (!Object.hasOwn(sys.arm, key)) {
            sys.arm[key] = { fn: {}, data: {} }
        }

        const r = () => ({ metadata, arm: sys.arm[key] })

        return {
            get: () => r(),
            set_fn: (...name) => (fn) => {
                name = name.flat()[0]
                const _fn = (...arg) => fn(r(), ...arg)
                sys.arm[key].fn[name] = _fn
            },
            reset() {
                delete sys.arm[key].data
                sys.arm[key].data = {}
            }
        }
    }
}