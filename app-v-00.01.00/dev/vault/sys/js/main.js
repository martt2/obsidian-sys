class main {
    async invoke() {
        this.loadConf()
        console.log('script start')
    }

    loadConf() {
        const dv = app.plugins.plugins.dataview.api
        global.conf = dv.page("pages/conf");
        console.log('load conf')
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