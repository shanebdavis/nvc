Foundation = require 'art-foundation'
React = require 'art-react'
Atomic = require 'art-atomic'
{Nvc} = require '../data'
{createFluxComponentFactory, FluxComponent} = require 'art-flux'

{point} = Atomic
{defineModule, log, inspect, isPlainObject, capitalize, peek, arrayWith, eq, createWithPostCreate} = Foundation

{
  createComponentFactory
  Component
  Element
  CanvasElement
  RectangleElement
  TextElement
  OutlineElement
  FillElement
} = React

CategoryButton = require './CategoryButton'
LeafButton = require './LeafButton'

{StyleProps} = Neptune.Nvc.App.Styles
{textStyle} = StyleProps

defineModule module, ->

  SubMapFactory = createWithPostCreate class SubMap extends FluxComponent

    @stateFields
      subKey: null

    drillIn: (@subKey)->

    render: ->
      {map, key} = @props
      {subKey} = @
      subMap = map[subKey]

      axisTypes =
        left: point 1, 0
        right: point -1, 0

      Element
        size: ww:1, hch:1
        # margin: 5
        clip: true
        childrenLayout: "column"
        animators: size: voidValue: ww: 1, h: 0

        Element
          size: ww:1, hch:1
          cacheDraw: true
          childrenLayout: "column"
          margin: 10
          key && RectangleElement color: "#0001", margin: 10, size: ww: 1, h: 2

          Element
            size: ww:1, hch:1
            childrenAlignment: "bottomCenter"
            childrenLayout: "flow"
            if isPlainObject map
                for k in Object.keys(map).sort()
                  v = map[k]
                  CategoryButton
                    category: k
                    subMap: v
                    selected: k == subKey
                    drillIn: @drillIn

            else
              for name in map.sort()
                LeafButton
                  name: name

        subMap && SubMapFactory key: subKey, map: subMap
