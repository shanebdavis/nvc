Foundation = require 'art-foundation'
React = require 'art-react'
Namespace = require './namespace'

ShowMap = require './ShowMap'
{Nvc} = require '../data'
{version} = require '../../../../package.json'

{
  w, log, inspect, defineModule, merge

  CanvasElement
  RectangleElement
  PagingScrollElement
  TextElement
  Element
  Component
  FluxComponent
} = require 'art-suite'

{textStyle} = Neptune.Nvc.App.Styles.StyleProps

defineModule module, class App extends FluxComponent
  @subscriptions "selected.selected"

  @stateFields
    canvasSize: null
    initialContentSize: null

  ready: ({target}) ->
    @canvasSize = target.currentSize

  initialContentReady: ({target}) ->
    @initialContentSize ||= target.currentSize

  render: ->
    {canvasSize, initialContentSize} = @state
    selectedNames = for name, selected of @selected || {} when selected
      name

    CanvasElement
      canvasId: "artCanvas"
      childrenLayout: "column"
      # on: ready: @ready
      RectangleElement inFlow: false, color: "#f9f9f9"

      PagingScrollElement
        startAtEnd: true

        Element
          size: ww: 1, hch:1
          padding: 5
          childrenLayout: "column"

          TextElement
            # inFlow: false
            size: ww:1, hch:1
            align: "center"
            fontFamily: "arial"
            color: "#0004"
            padding: 10
            text: "Needs and Emptions v#{version} by Shane Brinkman-Davis Delamore"

          ShowMap path: [], map: merge Nvc.core, (selectedNames.length > 0) && selected: selectedNames
