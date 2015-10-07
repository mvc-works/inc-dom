
var
  recorder $ require :actions-recorder
  Immutable $ require :immutable

var
  schema $ require :./schema
  updater $ require :./updater
  page $ require :./app/page

require :../style/main.css

recorder.setup $ {}
  :updater updater
  :initial schema.store

var render $ \ (store core)
  page store document.body

recorder.request render
recorder.subscribe render