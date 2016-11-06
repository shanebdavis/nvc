{log, defineModule, arrayWith, ApplicationState, compactFlatten, newObjectFromEach, merge, timeout} = require 'art-suite'

{A} = require('art-foundation').Browser.DomElementFactories

{getSelectedStatement} = Neptune.Nvc.Data.Nvc

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
    result = false
    @replaceState if @state[key]
      newObjectFromEach @state, (out, k, v) ->
        out[k] = true if v && k != key
    else
      result = true
      merge "#{key}": true, @state
    result


  email: ->
    sendEmail
      subject: "My current needs and emotions"
      body: """
        #{(getSelectedStatement k.split ' > ' for k, v of @state).sort().join '\n'}

        (Needs and Emotions App v#{Neptune.Nvc.version})
        """

  reset: -> @resetState()
