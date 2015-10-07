
Inc DOM(Demoed in CirruScript and Todolist)
----

Demo: http://repo.tiye.me/inc-dom/

### Usage

Also a small wrapper on [incremental-dom](http://google.github.io/incremental-dom) API.

```bash
npm i --save inc-dom
```

```coffee
IncDOM = require 'inc-dom'

{div, text} = IncDOM
br = IncDOM.createFactory 'br'

staticStyle =
  color: 'red'
staticAttrsWithKey =
  key: 'keyed'
  style: staticStyle
  onclick: (event) -> console.log :event

data = [] # which changes
mutableStyle = width: "#{data.length * 40}px"

IncDOM.render document.body, ->
  div staticAttrsWithKey, ->
    div null, (style: mutableStyle), ->
      br()
      text "this is a demo"
```

* `patch`: `IncrementalDOM.patch`
* `text`: `IncrementalDOM.patch`
* `createFactory`: `(tagName) -> (staticAttrs, [properties], cb) -> undefined`
* `createElement`: `(tagName, staticAttrs, [properties], cb) -> undefined`
* `div`: `createFactory('div')`
* `span`: `createFactory('span')`

Read demo code in [`src/app/page.cirru`](page) for details.

[page]: https://github.com/mvc-works/inc-dom/blob/master/src/app/page.cirru

Notice:

* `incremental-dom` API uses `key` for elements in an array.
  `inc-dom` puts `key` in `staticAttrs`, which is like in React.
* `properties` is optional.
* difference between `staticAttrs` and `properties` is the same as in `incremental-dom`.
  `staticAttrs` will not be changed after setting on DOM, `properties` will.
* `cb` is a function to ensure the excution order of children elements.
*  events are bound with `onclick`, unlike `onClick` in React.

This package is expertimental. Extend it if you want to create components.

### Wallpaper

Image credit <http://img.wallpapergang.com/139processed/Creative%20House%20Stair%20Design%20%20HD%20wallpaper.jpg>

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
