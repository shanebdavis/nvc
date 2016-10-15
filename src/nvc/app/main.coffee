AppNamespace = require './namespace'
require './styles'
require './models'
{App} = require './components'
{FullScreenApp, log} = require 'art-suite'

FullScreenApp.init title: AppNamespace.namespace.name
.then -> App().instantiateAsTopComponent()
.catch (e) ->
  log.error "Failed to init NVC app", e