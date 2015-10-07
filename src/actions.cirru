
var
  shortid $ require :shortid
  recorder $ require :actions-recorder

= exports.create $ \ (text)
  recorder.dispatch $ {}
    :type :todo/create
    :data $ {}
      :text text
      :id (shortid.generate)

= exports.update $ \ (id text)
  recorder.dispatch $ {}
    :type :todo/update
    :data $ {}
      :id id
      :text text

= exports.toggle $ \ (id)
  recorder.dispatch $ {}
    :type :todo/toggle
    :data id

= exports.toggle $ \ (id)
  recorder.dispatch $ {}
    :type :todo/remove
    :data id

= exports.archive $ \ ()
  recorder.dispatch $ {}
    :type :todo/remove
    :data null
