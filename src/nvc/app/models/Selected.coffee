{log, defineModule, arrayWith, ApplicationState} = require 'art-suite'

defineModule module, class Selected extends ApplicationState

  toggle: (key) ->
    log "Selected#toggle #{key}"
    @setState key, !@state[key]
