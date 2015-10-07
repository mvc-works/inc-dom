
var
  Color $ require :color
  keycode $ require :keycode

var
  IncDOM $ require :../inc-dom
  actions $ require :../actions
  stairBg $ require :../../images/stair.jpg
  taskComponent $ require :./task

var
  ({}~ patch div text input) IncDOM

var
  a $ IncDOM.createFactory :a
  repoUrl :http://github.com/mvc-works/inc-dom

var
  table $ {}
    :style $ {}
      :root $ {}
        :fontFamily ":Verdana, Helvetica, sans-serif"
        :padding ":40px 0 0 600px"
        :backgroundImage $ + ":url(" stairBg ":)"
        :backgroundSize :cover
        :position :absolute
        :width :100%
        :height :100%
      :input $ {}
        :lineHeight :30px
        :fontSize :16px
        :padding ":0 10px"
        :width :500px
        :outline :none
        :backgroundColor $ ... (Color) (hsl 20 100 100 0.8) (hslString)
        :border :none
      :panel $ {}
        :display :flex
        :justifyContent :flex-end
        :width :500px
        :marginTop :40px
      :archive $ {}
        :backgroundColor $ ... (Color) (hsl 20 80 60 0.6) (hslString)
        :color :white
        :lineHeight :30px
        :fontSize :14px
        :display :inline-block
        :padding ":0 10px"
      :link $ {}
        :color $ ... (Color) (hsl 200 70 100 0.6) (hslString)
        :fontSize :12px
        :marginTop :100px
        :display :block

    :events $ {}
      :onkeydown $ \ (event)
        if
          and
            is (keycode event.keyCode) :enter
            > event.target.value.length 0
          do
            actions.create event.target.value
            = event.target.value :
        , undefined
      :archive $ \ (event)
        actions.archive

= module.exports $ \ (props mountPoint)
  var
    todoTasks $ props.filter $ \ (task)
      task.get :done
  patch mountPoint $ \ ()

    div ({} (:style table.style.root)) $ \ ()
      div ({}) $ \ ()
        input
          {} (:style table.style.input) (:onkeydown table.events.onkeydown)
            :placeholder ":add task and hit enter..."
      div ({}) ({} (:style table.style.list)) $ \ ()
        props.forEach $ \ (task)
          taskComponent task
      if (> todoTasks.size 0)
        do $ div ({} (:style table.style.panel)) $ \ ()
          div ({} (:style table.style.archive) (:onclick table.events.archive)) $ \ ()
            text :archive
      , undefined
      a ({} (:style table.style.link) (:href repoUrl)) $ \ ()
        text ":Demo of incremental dom API wrapper, Read more on GitHub"
