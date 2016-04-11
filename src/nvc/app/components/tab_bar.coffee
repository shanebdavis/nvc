Foundation = require 'art-foundation'
React = require 'art-react'
{Nvc} = require '../data'
{createFluxComponentFactory, FluxComponent} = require 'art-flux'
{RectangleElement, Element, TextElement} = React

{textStyle} = Neptune.Nvc.App.Styles.StyleProps
{TabButton} = require './partials'

module.exports = createFluxComponentFactory
  subscriptions: "navState.currentPath navState.currentMap"

  pointerClick: ->
    {path, map} = @props
    @models.navState.currentPath = path
    @models.navState.currentMap = map

  render: ->
    {currentPath, currentMap} = @state
    {size} = @props
    rootMap = Nvc.core
    path = []

    Element
      size: size || ww:1, h:50
      voidProps:
        size: ww:1, h: 0
      animators: "size"
      RectangleElement color: "white"

      Element
        childrenLayout: "row"
        padding: (ps) -> h: ps.x / 12
        for k, v of Nvc.core
          do (k, v) =>
            TabButton
              action: =>
                @models.navState.currentPath = [k]
                @models.navState.currentMap = v
              text: k
              selected: k == currentPath[0]
