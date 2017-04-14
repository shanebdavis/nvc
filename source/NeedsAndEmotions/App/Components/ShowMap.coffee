Foundation = require 'art-foundation'
React = require 'art-react'
Atomic = require 'art-atomic'
{Nvc} = Neptune.NeedsAndEmotions.Data
{createFluxComponentFactory, FluxComponent} = require 'art-flux'

{
  point
  arrayWith, defineModule, log, inspect, isPlainObject, capitalize, peek, arrayWith, eq, createWithPostCreate
  isString
  createComponentFactory
  Component
  Element
  CanvasElement
  RectangleElement
  TextElement
  OutlineElement
  FillElement
  arrayWithout
} = require 'art-suite'

CategoryButton = require './CategoryButton'
LeafButton = require './LeafButton'
Button = require './Button'

StyleProps = require '../StyleProps'
{textStyle} = StyleProps

{Nvc} = Neptune.NeedsAndEmotions.Data

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
          childrenAlignment: "center"
          margin: 10
          path.length >= 1 && RectangleElement color: "#0001", margin: 10, size: ww: 1, h: 2

          if isString map
            [
              TextElement StyleProps.textStyle,
                size: ww:1, hch:1
                align: "center"
                text: map
                padding: 10
              LeafButton
                path: path
                if path[0] == "needs"
                  text: "I have all the #{peek path} I need."
                  selectedText: "I need more #{peek path}."
                else #if path[0] == "posEmotions"
                  text: "I am feeling neutral."
                  selectedText: "I am feeling #{peek path}."
                # else
                #   text: "I am not feeling #{peek path}."
                #   selectedText: "I am feeling #{peek path}."
            ]
          else
            Element
              size: ww:1, hch:1
              childrenAlignment: "bottomCenter"
              childrenLayout: "flow"
              if key?.match /selected/
                [
                  Element
                    size: ww:1, hch:1
                    childrenLayout: "row"
                    childrenAlignment: "center"
                    Button text: "email list", action: @models.selected.email, size: ww:1, hch:1
                    Button text: "reset", action: @models.selected.reset, size: ww:1, hch:1
                  for name in map.sort()
                    LeafButton
                      key: name
                      name: name
                      parentName: key
                      path: path
                ]

              else if isPlainObject map
                  for name in Object.keys(map).sort()
                    v = map[name]
                    CategoryButton
                      key: name
                      category: name
                      subMap: v
                      selected: name == subKey
                      drillIn: @drillIn

        subMap && SubMapFactory key: "subMap:#{subKey}", map: subMap, path: arrayWith path, subKey
