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

{textStyle} = Neptune.Nvc.App.Styles.StyleProps
{TabButton} = require '../partials'

MapLine = createFluxComponentFactory

  drillIn: ->
    {category, subMap} = @props
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

ShowMap = createFluxComponentFactory
  module: module

  backOut: ->
    path = @models.navState.currentPath = @models.navState.currentPath.slice 0, -1
    map = Nvc.core
    for k in path
      map = map[k]
    @models.navState.currentMap = map

  render: ->
    {map, category, indent, animate, key, currentPath} = @props

    Element
      size: ps: 1
      cacheDraw: true
      childrenLayout: "column"
      animators: "axis"
      voidProps: axis: point -1, 0

      if isPlainObject map
        Element
          size: ps: 1
          childrenAlignment: "bottomCenter"
          childrenLayout: "flow"
          for k, v of map
            MapLine
              category: k
              subMap: v
              indent: indent

      else
        TextElement textStyle,
          padding: 10
          size: ww:1, hch:1
          text: map.join ', '

      if currentPath.length > 1
        Element
          size: ww:1, h:50
          childrenLayout: "row"
          TabButton text: "◀︎", action: @backOut, size: hh:1, wh:1
          TabButton text: key, selected:true, size: ps: 1
          TabButton text: "", size: hh:1, wh:1

module.exports = createFluxComponentFactory class Top extends FluxComponent
  module: module
  subscriptions: "navState.currentPath navState.currentMap"

  # preprocessState: (newState) ->
  #   if @state.currentPath && @state.currentPath.length != newState.currentPath.length
  #     newState.lastPath = @state.currentPath
  #     newState.lastMap = @state.currentMap
  #   newState

  render: ->
    {currentPath, currentMap, lastPath, lastMap} = @state
    currentTab = peek currentPath

    Element
      size: ps: 1
      childrenLayout: "column"
      RectangleElement inFlow: false, color: "#f9f9f9"

      Element
        size: ps: 1
        padding: 5
        if currentPath.length > 0
          # if lastPath
          #   if lastPath.length > currentPath.length
          #     [
          #       ShowMap key: lastTab, category: "NVC", map: lastMap, currentPath:currentPath
          #       ShowMap key: currentTab, category: "NVC", map: currentMap, currentPath:currentPath
          #     ]
          #   else
          #     [
          #       ShowMap key: lastTab, category: "NVC", map: lastMap, currentPath:currentPath
          #       ShowMap key: currentTab, category: "NVC", map: currentMap, currentPath:currentPath
          #     ]
          # else
          ShowMap key: currentTab, category: "NVC", map: currentMap, currentPath:currentPath
        else
          Element
            size: ww:1, hch:1
            childrenLayout: "row"
            childrenAlignment: "center"

            TextElement textStyle,
              size: cs: 1
              padding: 10
              fontSize: 12

              text: """
                NVC Content
                (c) 2005 by Center for Nonviolent Communication
                Website: www.cnvc.org Email: cnvc@cnvc.org
                Phone: +1.505-244-4041
                """

