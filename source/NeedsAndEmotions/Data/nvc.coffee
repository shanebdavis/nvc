Foundation = require 'art-foundation'
{HotStyleProps} = require 'art-react'

{defineModule, log, arrayToFalseMap, wordsArray, deepMap, w, peek} = Foundation

splitOnLines = (str) -> str.split "\n"

{flatten} = require './Tools'

defineModule module, class Nvc extends HotStyleProps
  @categories: ["needs", "posEmotions" ,"negEmotions"]

  @needs:       require './needs'
  @posEmotions: require './PositiveEmotions'
  @negEmotions: require './NegativeEmotions'

  @core:
    needs:        @needs
    posEmotions:  @posEmotions
    negEmotions:  @negEmotions

  @flattened: flatten
    core: @core
    {}

  @getNotSelectedStatement: (path) ->
    last = peek(path).replace /_/g, ' '
    if path[0] == "needs"
      "I have all the #{last} I need."
    else
      "I am feeling neutral."

  @getSelectedStatement: (path) ->
    last = peek(path).replace /_/g, ' '
    if path[0] == "needs"
      "I need more #{last}."
    else
      "I am feeling #{last}."
