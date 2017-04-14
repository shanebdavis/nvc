{defineModule, FluxComponent, Element, TextElement, FillElement, RectangleElement, log} = require 'art-suite'
StyleProps = require '../StyleProps'
{PointerActionsMixin} = require 'art-react/mixins'
Button = require './Button'

{getSelectedStatement} = Neptune.NeedsAndEmotions.Data.Nvc

defineModule module, ->

  class LeafButton extends PointerActionsMixin FluxComponent
    @subscriptions selected: getSelectedKey = ({name, path}) ->

      if path[0] != "selected"
        out = path.join ' > '
        out += " > #{name}" if name
        out
      else name

    action: ->
      selected = @models.selected.toggle getSelectedKey @props

    render: ->
      {name, parentName, text, selectedText} = @props

      if name?.match /\ >\ /
        [first, middle..., last] = path = name.split " > "
        first = switch first
          when "needs" then "🌳"
          when "negEmotions" then "☹️"
          when "posEmotions" then "😀"
          else first
        name = "#{first} #{getSelectedStatement path}"


      Button
        color:    StyleProps.leafColor
        text:     (@selected && selectedText) || text || name
        small:    true
        selected: @selected
        action:   @action
