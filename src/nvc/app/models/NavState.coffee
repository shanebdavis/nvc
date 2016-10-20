Foundation = require 'art-foundation'
Flux = require 'art-flux'
Data = require '../data'

{defineModule, arrayWith, log} = Foundation
{ApplicationState} = Flux

defineModule module, class NavState extends ApplicationState
  @stateFields
    context: ""
