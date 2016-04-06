Foundation = require 'art-foundation'
React = require 'art-react'
Atomic = require 'art-atomic'
Namespace = require './namespace'
{Nvc} = require '../../data'
{createFluxComponentFactory, FluxComponent} = require 'art-flux'

{point} = Atomic
{log, inspect, isPlainObject, capitalize, peek, arrayWith} = Foundation

{
  createComponentFactory
  Component
  Element
  CanvasElement
  RectangleElement
  TextElement
  PagingScrollElement
  OutlineElement
} = React

textStyle =
  color: "#000a"
  fontFamily: "sans-serif"
  fontSize: 18 #if subMap then 18 else 16

MapLine = createFluxComponentFactory

  drillIn: ->
    {category, subMap, showSubMap} = @props
    if subMap
      @models.navState.currentMap = subMap
      @models.navState.currentPath = arrayWith @models.navState.currentPath, category

  render: ->
    {category, subMap, selected, color, indent} = @props
    color = if selected then "orange" else "white"
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
        padding: if subMap then 20 else 15
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
      size: ps: 1
      cacheDraw: true
      childrenLayout: "column"
      animators: "axis"
      voidProps: axis: point -1, 0

      if isPlainObject map
        Element
          size: ps: 1
          childrenAlignment: "centerCenter"
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

      # showSubMap?.map && Element
      #   size: ww:1, hch:1
      #   margin: 4
      #   childrenLayout: "column"
        # addedAnimation: animate && from: opacity: 0
        # removedAnimation: animate && to: opacity: 0

        # RectangleElement color: "orange",
        #   margin: 4
        #   size: ww:1, h:2

        # showSubMap?.map && Element
        #   size: ww: 1, hch:1

        #   ShowMap showSubMap, key: showSubMap.category, animate: true

TabButton = createFluxComponentFactory

  pointerClick: ->
    {path, map} = @props
    @models.navState.currentPath = path
    @models.navState.currentMap = map

  render: ->
    {text, selected} = @props
    emojiMap =
      needs: "🍎"
      negEmotions: "☹️"
      posEmotions: "😀"
    props = if emojiText = emojiMap[text]
      text: emojiText
      fontSize: 32
      color: "black"
    else
      text: text

    Element
      on: pointerClick: @pointerClick
      selected && RectangleElement
        color: "orange"
        padding: 5
        radius: 5
      TextElement textStyle, props,
        size: ps: 1
        align: .5

TabBar = createFluxComponentFactory
  subscriptions: "navState.currentPath navState.currentMap"
  render: ->
    {currentPath, currentMap} = @state

    Element
      size: ww:1, h:50
      voidProps:
        size: ww:1, h: 0
      animators: "size"
      RectangleElement color: "white"

      Element
        childrenLayout: "row"
        padding: (ps) -> h: ps.x / 12
        switch currentPath.length
          when 0, 1
            for k in Nvc.categories
              TabButton
                path: [k]
                map: Nvc[k]
                text: k
                selected: k == peek currentPath
          else
            rootMap = Nvc.core
            path = []
            for p, i in currentPath
              path = arrayWith path, p
              TabButton
                path: path
                map: rootMap = rootMap[p]
                text: p
                selected: i == currentPath.length - 1

module.exports = createFluxComponentFactory class Top extends FluxComponent
  module: module
  subscriptions: "navState.currentPath navState.currentMap"

  render: ->
    {currentPath, currentMap} = @state
    currentTab = peek currentPath

    Element
      size: ps: 1
      childrenLayout: "column"
      RectangleElement inFlow: false, color: "#f9f9f9"

      Element
        size: ps: 1
        currentMap && ShowMap key: currentTab, category: "NVC", map: currentMap

      TabBar()
