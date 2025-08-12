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

        await this.load_conf()
        sys.main = this
        sys.arm = {}
        console.log('script start')
    }

    async load_conf() {
        sys.conf = await app.vault.readJson('sys/conf/conf.json')
        console.log('conf load')
    }

    async cmd(cmd = '', data = {}) {
        return fetch(`http://localhost:${sys.conf.port}/cmd`, {
            method: "POST",
            body: JSON.stringify({ cmd, data })
        })
    }

    arm = () => {
        const yaml = ()=>{
            const file = app.workspace.getActiveFile();
            const res = app.metadataCache.getFileCache(file)?.frontmatter || {};
            return res
        }

        const key = yaml().arm || '_';

        if (!Object.hasOwn(sys.arm, key)) {
            sys.arm[key] = {}
        }

        return {
            get() {
                sys.arm[key].yaml = yaml()
                return sys.arm[key]
            },

            reset() {
                sys.arm[key] = {}
            }
        }
    }

    md_list = (dv) => {
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
                    li.append(span, el)
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

        return recursive
    }

    db_convert = (db = {}, idStart = "") => {
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
    }

    db_convert_path = (db = {}, idStart = "") => {
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

    flexbox(dv, ...arr) {
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
    }

}