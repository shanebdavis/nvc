Foundation = require 'art-foundation'
Flux = require 'art-flux'
Data = require '../data'

{defineModule, arrayWith} = Foundation
{ApplicationState} = Flux

defineModule module, class NavState extends ApplicationState
  @stateFields
    currentPath: []

  drillIn: (name, map, depth) ->
    {currentPath} = @
    if depth?
      currentPath = currentPath.slice 0, depth
    @currentPath = arrayWith currentPath, name:name, map:map
