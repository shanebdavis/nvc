Foundation = require 'art-foundation'
React = require 'art-react'
Atomic = require 'art-atomic'
Namespace = require './namespace'
{createFluxComponentFactory} = require 'art-flux'

{point} = Atomic
{log, inspect, isPlainObject, capitalize} = Foundation

{
  createComponentFactory
  Component
  Element
  CanvasElement
  RectangleElement
  TextElement
  PagingScrollElement
} = React

textStyle =
  color: "#000a"
  fontFamily: "sans-serif"
  fontSize: 18 #if subMap then 18 else 16

MapLine = createFluxComponentFactory

  drillIn: ->
    {category, subMap, showSubMap} = @props

    showSubMap && showSubMap
      category: category
      map: subMap

  render: ->
    {category, subMap, selected, color, indent} = @props
    color = if selected then "orange" else if subMap then "white" else "#fff0"
    indent ||= 0
    Element
      size: wcw:1, hch: 1
      on: pointerClick: @drillIn
      RectangleElement
        inFlow: false
        color: "white"
        animate: to: color: color
        padding: 3
      TextElement textStyle,
        size: hch: 1, wcw:1
        padding: if subMap then 20 else 10
        align: "centerLeft"
        text: category

ShowMap = createComponentFactory
  module: module
  setShowSubMap: (props) ->
    if props.category == @state.showSubMap?.category
      @clearShowSubMap()
    else
      @setState showSubMap: props

  clearShowSubMap: ->
    @setState showSubMap: false

  render: ->
    {map, category, indent, animate} = @props
    {showSubMap} = @state

    Element
      size: ww: 1, hch:1
      cacheDraw: true
      childrenLayout: "column"
      addedAnimation: animate && from: axis: point -1, 0
      removedAnimation: animate && to: axis: "topRight"

      if isPlainObject map
        Element
          size: ww: 1, hch:1
          childrenLayout: "flow"
          for k, v of map
            v && showSubMap ||=
              category: k
              map: v
            MapLine
              category: k
              subMap: v
              indent: indent
              selected: showSubMap?.category == k
              showSubMap: @setShowSubMap

      else
        TextElement textStyle,
          padding: 10
          size: ww:1, hch:1
          text: map.join ', '

      showSubMap?.map && Element
        size: ww:1, hch:1
        margin: 4
        childrenLayout: "column"
        # addedAnimation: animate && from: opacity: 0
        # removedAnimation: animate && to: opacity: 0

        RectangleElement color: "orange",
          margin: 4
          size: ww:1, h:2

        showSubMap?.map && Element
          size: ww: 1, hch:1

          ShowMap showSubMap, key: showSubMap.category, animate: true

module.exports = createFluxComponentFactory
  module: module
  subscriptions: "nvc.core"
  render: ->
    Element
      size: ps: 1
      RectangleElement inFlow: false, color: "#f9f9f9"
      PagingScrollElement
        padding: top: 20
        size: ps: 1
        ShowMap category: "NVC", map: @state.core
