
var
  IncDOM $ require :../inc-dom

var
  ({}~ render div text) IncDOM

= module.exports $ \ (props mountPoint)
  render mountPoint $ \ ()
    var
      styleRoot $ {}
        :color :blue
        :fontFamily ":Verdana, Helvetica, sans-serif"
      onClick $ \ (event)
        console.log :click :event event
    div null ({} (:onclick onClick) (:style styleRoot)) null $ \ ()
      text :demo
