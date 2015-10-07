
var
  IncrementalDOM $ require :incremental-dom

var
  ({}~ elementOpen elementVoid elementClose text) IncrementalDOM

var object2array $ \ (properties)
  = properties $ or properties ({})
  var result ([])
  var fields $ Object.keys properties
  fields.forEach $ \ (key)
    result.push key (. properties key)
  console.log result
  , result

var selfClosing $ []
  , :area
  , :base
  , :br
  , :col
  , :embed
  , :hr
  , :img
  , :input
  , :keygen
  , :link
  , :meta
  , :param
  , :source
  , :track
  , :wbr

var
  createElement $ \ (tagName key staticAttrs properties cb)
    var
      propertiesInArray (object2array properties)
    if (in selfClosing tagName)
      do
        elementVoid tagName key
          object2array staticAttrs
          ... propertiesInArray
      do
        elementOpen tagName key
          object2array staticAttrs
          ... propertiesInArray
        cb
        elementClose tagName
    , undefined

  createFactory $ \ (tagName)
    \ (key staticAttrs properties cb)
      createElement tagName key staticAttrs properties cb

= exports.createElement createElement
= exports.createFactory createFactory
= exports.render IncrementalDOM.patch
= exports.text text

var definedTags $ [] :div :span :input :textarea

definedTags.forEach $ \ (tagName)
  = (. exports tagName) $ exports.createFactory tagName
