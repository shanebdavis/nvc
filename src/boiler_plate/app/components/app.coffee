Foundation = require 'art-foundation'
React = require 'art-react'
Namespace = require './namespace'

{log, inspect} = Foundation

{
  createComponentFactory
  Component
  Element
  CanvasElement
  Rectangle
  TextElement
} = React

module.exports = createComponentFactory
  hotModule: module

  render: ->

    CanvasElement
      canvasId: "artCanvas"
      Rectangle color: "white"
      TextElement
        padding: 10
        color: "#000a"
        fontFamily: "sans-serif"
        text: "Hello from #{Namespace.namespace.namespace.name}!"
