Foundation = require 'art-foundation'
React = require 'art-react'
Namespace = require './namespace'

ShowMap = require './ShowMap'
{Nvc} = require '../data'

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

      TextElement
        inFlow: false
        size: ww:1, hch:1
        align: "center"
        fontFamily: "arial"
        color: "#0004"
        padding: 10
        text: "by Shane Brinkman-Davis Delamore"

      Element
        size: ps: 1
        padding: 5
        childrenLayout: "column"
        childrenAlignment: "bottomCenter"
        # on: ready: @initialContentReady
        # Element
        #   size: h: canvasSize?.y - initialContentSize?.y - 10|| 0
        #   RectangleElement color: "red"
        # Element
        #   size: ww:1, hch:1
        #   childrenLayout: "row"
        #   childrenAlignment: "center"

        #   TextElement textStyle,
        #     size: cs: 1
        #     padding: 10
        #     fontSize: 12

        #     text: """

        #       Needs list and App by
        #       Shane Brinkman-Davis Delamore
        #       v#{Neptune.Nvc.version}

        #       Emotion lists:
        #       NVC Content
        #       (c) 2005 by Center for Nonviolent Communication
        #       Website: www.cnvc.org Email: cnvc@cnvc.org
        #       Phone: +1.505-244-4041

        #       """

        ShowMap map: merge Nvc.core, (selectedNames.length > 0) && selected: selectedNames
