{defineModule, Component, Element, TextElement, FillElement, RectangleElement, log} = require 'art-suite'
{StyleProps} = Neptune.Nvc.App.Styles
{PointerActionsMixin} = require 'art-react/mixins'
Button = require './Button'

defineModule module, ->

  emojiMap =
    needs: "🌳"
    negEmotions: "☹️"
    posEmotions: "😀"
    selected: "💡"

  subtextMap =
    needs: "needs"
    negEmotions: "emotions"
    posEmotions: "emotions"
    surviving: "animal"
    thriving: "mamal"
    transcending: "human"
    selected: "my selection"

  class CategoryButton extends Component

    doAction: ->
      {category, subMap, drillIn} = @props
      if subMap
        drillIn category, subMap

    render: ->
      {category, selected} = @props
      Button
        selected: selected
        color:    StyleProps.primaryColor
        emoji:    emojiMap[category]
        text:     category
        subtext:  subtextMap[category]
        action:   @doAction
