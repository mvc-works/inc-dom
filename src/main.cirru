
var
  recorder $ require :actions-recorder
  Immutable $ require :immutable

var
  schema $ require :./schema
  updater $ require :./updater
  page $ require :./app/page

require :../style/main.css

var
  table $ {}
    :store $ ... schema.store
      push $ ... schema.task
        set :id :1
        set :text ":task 1"
      push $ ... schema.task
        set :id :2
        set :text ":task 2 demo"
        set :done true

recorder.setup $ {}
  :updater updater
  :initial table.store

var render $ \ (store core)
  console.info :udpate (JSON.stringify store)
  page store document.body

recorder.request render
recorder.subscribe render