{log, defineModule, arrayWith, ApplicationState} = require 'art-suite'

defineModule module, class Selected extends ApplicationState
  @persistant()

  toggle: (key) -> @setState key, !@state[key]
