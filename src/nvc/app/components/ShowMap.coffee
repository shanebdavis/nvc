Foundation = require 'art-foundation'
React = require 'art-react'
Atomic = require 'art-atomic'
{Nvc} = require '../data'
{createFluxComponentFactory, FluxComponent} = require 'art-flux'

{point} = Atomic
{arrayWith, defineModule, log, inspect, isPlainObject, capitalize, peek, arrayWith, eq, createWithPostCreate} = Foundation

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
Button = require './Button'

{StyleProps} = Neptune.Nvc.App.Styles
{textStyle} = StyleProps

{Nvc} = require '../data'

defineModule module, ->

  SubMapFactory = createWithPostCreate class SubMap extends FluxComponent

    @stateFields
      subKey: null

    drillIn: (@subKey)->

    render: ->
      {map, key, path} = @props
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
          path.length >= 1 && RectangleElement color: "#0001", margin: 10, size: ww: 1, h: 2

          Element
            size: ww:1, hch:1
            childrenAlignment: "bottomCenter"
            childrenLayout: "flow"
            if isPlainObject map
                for k in Object.keys(map).sort()
                  v = map[k]
                  CategoryButton
                    key: k
                    category: k
                    subMap: v
                    selected: k == subKey
                    drillIn: @drillIn

            else
              log key:key
              [
                if key.match /selected/
                  Element
                    size: ww:1, hch:1
                    childrenLayout: "row"
                    childrenAlignment: "center"
                    Button text: "email list", action: @models.selected.email, size: ww:1, hch:1
                for name in map.sort()
                  LeafButton
                    key: name
                    name: name
                    parentName: key
                    path: path
              ]

        subMap && SubMapFactory key: "subMap:#{subKey}", map: subMap, path: arrayWith path, subKey
