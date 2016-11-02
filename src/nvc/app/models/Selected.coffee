{log, defineModule, arrayWith, ApplicationState, compactFlatten, newObjectFromEach, merge, timeout} = require 'art-suite'

{A} = require('art-foundation').Browser.DomElementFactories

sendEmail = ({address, subject, body}) ->
    link = "mailto:#{address||""}"
    params = compactFlatten [
      subject && "subject=#{encodeURIComponent subject}"
      body && "body=#{encodeURIComponent body}"
    ]
    link += "?#{params.join '&'}" if params.length > 0
    A href: link, target: "black"
    .click()



defineModule module, class Selected extends ApplicationState
  @persistant()

  toggle: (key) ->

    @replaceState log if @state[key]
      newObjectFromEach @state, (out, k, v) ->
        out[k] = true if v && k != key
    else
      merge "#{key}": true, @state


  email: ->
    sendEmail
      subject: "Needs and Emotions"
      body: Object.keys(@savableState).sort().join '\n'

  reset: -> @resetState()
