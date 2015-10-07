
var
  Immutable $ require :immutable

var
  schema $ require :../schema

= exports.create $ \ (store actionData)
  var
    id $ actionData.get :id
    text $ actionData.get :text
  store.unshift $ ... schema.task
    set :id id
    set :text text

= exports.update $ \ (store actionData)
  var
    id $ actionData.get :id
    text $ actionData.get :text
  store.map $ \ (task)
    cond (is (task.get :id) id)
      task.set :text text
      , task

= exports.toggle $ \ (store id)
  store.map $ \ (task)
    cond (is (task.get :id) id)
      task.update :done $ \ (status)
        not status
      , task

= exports.remove $ \ (store id)
  store.filterNot $ \ (task)
    is (task.get :id) id

= exports.archive $ \ (store actionData)
  store.filterNot $ \ (task)
    task.get :done
