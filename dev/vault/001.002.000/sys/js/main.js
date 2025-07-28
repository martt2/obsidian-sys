class main {
    async invoke() {
        this.start()
    }

    async cmd(cmd) {
        return fetch("http://localhost:5000/cmd", {
            method: "POST",
            body: cmd
        })
    }

    start() {
        const dv = app.plugins.plugins.dataview.api
        global.conf = dv.page("pages/conf");
        global.main = this
        global.arm = {}
        console.log('script start')
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

        arr.forEach(el => {
            return dv.el("li", el, {
                container: ul,
                cls: "sys-flexbox-li"
            })
        })

        return dv.container
    }

}