
var
  shortid $ require :shortid
  recorder $ require :actions-recorder

= exports.create $ \ (text)
  recorder.dispatch :todo/create $ {}
    :text text
    :id (shortid.generate)

= exports.update $ \ (id text)
  recorder.dispatch :todo/update $ {}
    :id id
    :text text

= exports.toggle $ \ (id)
  recorder.dispatch :todo/toggle id

= exports.remove $ \ (id)
  recorder.dispatch :todo/remove id

= exports.archive $ \ ()
  recorder.dispatch :todo/archive
