Foundation = require 'art-foundation'
Flux = require 'art-flux'

{createHotWithPostCreate} = Foundation
{ApplicationState} = Flux

module.exports = createHotWithPostCreate module, class NavState extends ApplicationState
  @stateFields
    currentTab: "needs"

