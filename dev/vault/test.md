# test

```dataviewjs
//const res = sys.main.db_convert(sys.conf.database, "main")
//sys.main.md_list(dv)(res)

```

```dataviewjs

const db_convert = (db = {}, idStart = "") => {
	const res = [];

	const recursive = ({ id = "", name = "", data = [] }, path=[]) => {
		if (data.length > 0) {
			//const res = []

			for (const el of data) {
				const newPath = [...path, name]
				const el1 = recursive(db[el], newPath)
				res.push(el1)
			}

			//return [name, res]
		} else {
			return [...path, name]
		}
	}

	recursive(db[idStart])
	return res
	//return recursive(db[idStart])
}

const res = db_convert(sys.conf.database, "main")
console.log(res)

```