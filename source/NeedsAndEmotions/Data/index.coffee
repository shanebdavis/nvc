# generated by Neptune Namespaces v3.x.x
# file: NeedsAndEmotions/Data/index.coffee

module.exports = require './namespace'
module.exports
.includeInNamespace require './Data'
.addModules
  EmojiMap:         require './EmojiMap'        
  NavigationGraph:  require './NavigationGraph' 
  Needs:            require './Needs'           
  NegativeEmotions: require './NegativeEmotions'
  OrderedNeedsList: require './OrderedNeedsList'
  PositiveEmotions: require './PositiveEmotions'
  Tools:            require './Tools'           