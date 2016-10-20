{defineModule, FluxComponent, Element, TextElement, FillElement, RectangleElement, log} = require 'art-suite'
{StyleProps} = Neptune.Nvc.App.Styles
{PointerActionsMixin} = require 'art-react/mixins'
Button = require './Button'

defineModule module, ->

  class LeafButton extends PointerActionsMixin FluxComponent
    @subscriptions selected: getSelectedKey = ({name, path}) ->

      if path[0] != "selected"
        "#{path.join ' > '} > #{name}"
      else name

    action: ->
      @models.selected.toggle getSelectedKey @props

    render: ->
      {name, parentName} = @props

      if name.match /\ >\ /
        [first, middle..., secondToLast, last] = name.split " > "
        first = switch first
          when "needs" then "🌳"
          when "negEmotions" then "☹️"
          when "posEmotions" then "😀"
          else first
        name = "#{first} #{secondToLast} > #{last}"


      Button
        color:    StyleProps.leafColor
        text:     name
        small:    true
        selected: @selected
        action:   @action
