
Inc DOM(Demoed in CirruScript and Todolist)
----

Demo: http://repo.tiye.me/inc-dom/

### Usage

Also a small wrapper on [incremental-dom][http://google.github.io/incremental-dom] API.

```bash
npm i --save inc-dom
```

```coffee
IncDOM = require 'inc-dom'

onclick = (event) -> console.log :event

{div, text} = IncDOM
br = IncDOM.createFactory 'br'

data = [] # which changes

IncDOM.render document.body, ->
  IncDOM.div (key: 'keyed'), (style: {color: 'red'}), onclick: onclick, ->
    IncDOM.div null, (style: {width: "#{data.length * 40}px"}), ->
      br()
      IncDOM.text
```

* `patch`: `IncrementalDOM.patch`
* `text`: `IncrementalDOM.patch`
* `createFactory`: `(tagName) -> (staticAttrs, properties, cb) -> undefined`
* `createElement`: `(tagName, staticAttrs, properties, cb) -> undefined`
* `div`: `createFactory('div')`
* `span`: `createFactory('span')`

Read demo code in `src/app/page` for details.

### On `incremental-dom` API

* `incremental-dom` API uses `key` for elements in an array.
  `inc-dom` puts `key` in `staticAttrs`, which is like in React.

* when called with 1 less arguments, `properties` will be omitted.

* the difference between `staticAttrs` and `properties` is the name as `incremental-dom`.
  `staticAttrs` will not change after setting on DOM, `properties` will.

* `cb` is a function to ensure the excution order or children elements.

This package is expertimental. Extend it if you want to create components.

### Wallpaper

Credit <http://img.wallpapergang.com/139processed/Creative%20House%20Stair%20Design%20%20HD%20wallpaper.jpg>

### Usage

* Development

```text
npm i
gulp html
webpack-dev-server --hot
```

* Production

```text
gulp buld
gulp rsync
```

### License

MIT
