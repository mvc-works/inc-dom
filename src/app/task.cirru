
var
  Color $ require :color

var
  IncDOM $ require :../inc-dom
  actions $ require :../actions

var
  ({}~ div text) IncDOM

var
  table $ {}
    :style $ {}
      :root $ {}
        :fontSize :15px
        :lineHeight :40px
        :backgroundColor $ ... (Color) (hsl 0 100 100 0.4) (hslString)
        :width :500px
        :marginTop :10px
        :display :flex
      :checkbox $ \ (status)
        {}
          :display :inline-block
          :width :30px
          :height :30px
          :backgroundColor $ cond status
            ... (Color) (hsl 240 40 70 0.9) (hslString)
            ... (Color) (hsl 240 40 70 0.2) (hslString)
          :verticalAlign :middle
          :marginRight :10px
          :WebkitUserSelect :none
      :remove $ {}
        :backgroundColor $ ... (Color) (hsl 20 80 60 0.6) (hslString)
        :width :30px
        :height :30px
        :verticalAlign :middle
        :display :inline-block
      :text $ {}
        :flex 1
        :display :inline-block
        :lineHeight :30px
        :color :white

= module.exports $ \ (props)
  var
    onToggle $ \ (event)
      actions.toggle (props.get :id)
    onRemove $ \ (event)
      actions.remove (props.get :id)

  div ({} (:key $ props.get :id) (:style table.style.root)) $ \ ()
    div
      {} (:onclick onToggle)
      {} (:style $ table.style.checkbox (props.get :done))
    div ({} (:style table.style.text)) $ \ ()
      text (props.get :text)
    div $ {} (:onclick onRemove) (:style table.style.remove)
