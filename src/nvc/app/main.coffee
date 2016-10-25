AppNamespace = require './namespace'
require './styles'
require './models'
{App} = require './components'
{FullScreenApp, log} = require 'art-suite'

FullScreenApp.init
  title: "Needs & Emotions"
.then -> App().instantiateAsTopComponent()
.catch (e) ->
  log.error "Failed to init NVC app", e