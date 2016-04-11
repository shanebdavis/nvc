Foundation = require 'art-foundation'
React = require 'art-react'
Namespace = require './namespace'

Pages = require './pages'
TabBar = require './tab_bar'

{log, inspect} = Foundation

{
  createComponentFactory
  CanvasElement
} = React

module.exports = createComponentFactory
  module: module

  render: ->
    CanvasElement
      canvasId: "artCanvas"
      childrenLayout: "column"
      Pages.ShowMap()
      TabBar()
