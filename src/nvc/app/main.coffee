AppNamespace = require './namespace'
require './styles'
require './models'
{App} = require './components'
{FullScreenApp, log} = require 'art-suite'

FullScreenApp.init
  title:    "Needs"
  meta:     "apple-mobile-web-app-status-bar-style": "default"
  manifest: "assets/needs.manifest"
  link:
    "apple-touch-icon":           href: "assets/needs256.png"
    "apple-touch-startup-image":  href: "assets/loading320x480.png"
    # evidently apple-touch-startup-image has been broken since iOS9
    # https://forums.developer.apple.com/thread/23924
.then -> App().instantiateAsTopComponent()
.catch (e) ->
  log.error "Failed to init NVC app", e