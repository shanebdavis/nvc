Foundation = require 'art-foundation'
React = require 'art-react'
{createFluxComponentFactory, FluxComponent} = require 'art-flux'
{RectangleElement, Element, TextElement} = React

{StyleProps} = Neptune.Nvc.App.Styles
{textStyle} = StyleProps

module.exports = createFluxComponentFactory

  render: ->
    {text, selected, action, size} = @props

    emojiMap =
      needs: "🌳"
      negEmotions: "☹️"
      posEmotions: "😀"
    props = if emojiText = emojiMap[text]
      text: emojiText
      fontSize: 32
      color: "black"
    else
      text: text

    Element
      size: size
      on: pointerClick: action
      selected && RectangleElement
        color: StyleProps.primaryColor
        padding: 5
        radius: 5
      TextElement textStyle, props,
        size: cs: 1
        padding: h:10
        location: ps: .5
        axis: .5
