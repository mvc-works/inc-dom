
var
  todo $ require :./todo

= module.exports $ \ (store actionType actionData)
  case actionType
    :todo/create $ todo.create store actionData
    :todo/update $ todo.update store actionData
    :todo/toggle $ todo.toggle store actionData
    :todo/remove $ todo.remove store actionData
    :todo/archive $ todo.archive store actionData
    else store
