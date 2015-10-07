
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
  createElement $ \ (tagName staticAttrs properties cb)
    if (is (typeof properties) :function) $ do
      = cb properties
      = properties ({})
    var
      propertiesInArray (object2array properties)
    if (in selfClosing tagName)
      do
        elementVoid tagName staticAttrs.key
          object2array staticAttrs
          ... propertiesInArray
      do
        elementOpen tagName staticAttrs.key
          object2array staticAttrs
          ... propertiesInArray
        if (? cb) (cb)
        elementClose tagName
    , undefined

  createFactory $ \ (tagName)
    \ (staticAttrs properties cb)
      createElement tagName staticAttrs properties cb

= exports.createElement createElement
= exports.createFactory createFactory
= exports.patch IncrementalDOM.patch
= exports.text text

var definedTags $ [] :div :span :input :textarea

definedTags.forEach $ \ (tagName)
  = (. exports tagName) $ exports.createFactory tagName
