{log, defineModule, arrayWith, ApplicationState} = require 'art-suite'

defineModule module, class Selected extends ApplicationState
  log persistant: @persistant
  @persistant()

  toggle: (key, context) ->
    context ||= @models.navState.context
    @setState key, if @state[key]
      false
    else
      context || true
