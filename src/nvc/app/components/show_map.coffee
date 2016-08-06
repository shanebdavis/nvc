Foundation = require 'art-foundation'
React = require 'art-react'
Atomic = require 'art-atomic'
{Nvc} = require '../data'
{createFluxComponentFactory, FluxComponent} = require 'art-flux'

{point} = Atomic
{log, inspect, isPlainObject, capitalize, peek, arrayWith, eq, createWithPostCreate} = Foundation

{
  createComponentFactory
  Component
  Element
  CanvasElement
  RectangleElement
  TextElement
  PagingScrollElement
  OutlineElement
  FillElement
} = React

{StyleProps} = Neptune.Nvc.App.Styles
{textStyle} = StyleProps
{TabButton} = require './partials'

emojiMap =
  needs: "🌳"
  negEmotions: "☹️"
  posEmotions: "😀"

subtextMap =
  needs: "needs"
  negEmotions: "emotions"
  posEmotions: "emotions"
  surviving: "animal"
  thriving: "mamal"
  transcending: "human"

MapLine = createFluxComponentFactory

  drillIn: ->
    {category, subMap, drillIn} = @props
    if subMap
      drillIn category, subMap

  render: ->
    {category, subMap, selected, color, indent} = @props
    color = if selected then StyleProps.primaryColor else "white"
    indent ||= 0

    subtext = subtextMap[category]

    Element
      size: wcw:1, hch: 1
      on: pointerClick: @drillIn
      RectangleElement
        inFlow: false
        color: "white"
        animate: to: color: color
        padding: 3
      if emojiText = emojiMap[category]
        Element
          size: 100
          padding: 18
          TextElement
            text: emojiText
            location: ps: .5
            axis: "centerCenter"
            scale: (ps, cs) -> ps.div(cs).min()
            layoutMode: "tight"
            fontSize: 64
            # RectangleElement color: "yellow"
            # FillElement()
      else
        TextElement textStyle,
          size: cs:1
          align: "centerCenter"
          text: category
          padding: if subMap then 20 else 15
      subtext &&
        TextElement textStyle,
          fontSize: 10
          location: ww:.5, yh: 1, y:-8
          size: cs:1
          axis: "bottomCenter"
          text: subtext

module.exports = SubMapFactory = createWithPostCreate class SubMap extends FluxComponent
  module: module

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
      margin: 5
      clip: true
      childrenLayout: "column"

      Element
        size: ww:1, hch:1
        cacheDraw: true
        childrenLayout: "column"
        margin: 5
        key && RectangleElement color: StyleProps.primaryColor, margin: 5, size: ww:1, h:1
          # size: ww:1, h:50
          # childrenLayout: "row"
          # TabButton text: key, selected:true, size: ps: 1

        if isPlainObject map
          Element
            size: ww:1, hch:1
            childrenAlignment: "bottomCenter"
            childrenLayout: "flow"
            for k in Object.keys(map).sort()
              v = map[k]
              MapLine
                category: k
                subMap: v
                selected: k == subKey
                drillIn: @drillIn

        else
          Element
            size: ww:1, hch:1
            childrenLayout: "row"
            childrenAlignment: "center"
            TextElement textStyle,
              padding: 10
              size: ww:1, hch:1, max: w: 600
              text: map.sort?().join(', ') || map
              align: "center"

      subMap && SubMapFactory key: subKey, map: subMap
