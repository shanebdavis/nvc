{defineModule, FluxComponent, Element, TextElement, FillElement, RectangleElement, log} = require 'art-suite'
{StyleProps} = Neptune.Nvc.App.Styles
{PointerActionsMixin} = require 'art-react/mixins'
Button = require './Button'

defineModule module, ->

  class LeafButton extends PointerActionsMixin FluxComponent
    @subscriptions selected: ({name}) -> name

    action: -> @models.selected.toggle @props.name

    render: ->
      {name} = @props
      Button
        color:    StyleProps.leafColor
        text:     name
        small: true
        selected: @selected
        action: @action
