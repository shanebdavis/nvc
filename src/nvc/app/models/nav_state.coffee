Foundation = require 'art-foundation'
Flux = require 'art-flux'
Data = require '../data'

{createHotWithPostCreate} = Foundation
{ApplicationState} = Flux

module.exports = createHotWithPostCreate module, class NavState extends ApplicationState
  @stateFields
    currentPath: []
    currentMap: Data.Nvc.core

