{defineModule, Component, Element, TextElement, FillElement, RectangleElement, log, rgbColor} = require 'art-suite'
{PointerActionsMixin} = require 'art-react/mixins'
{StyleProps} = Neptune.Nvc.App.Styles

defineModule module, ->

  class Button extends PointerActionsMixin Component

    doAction: -> @props?.action()

    render: ->
      {text, subtext, emoji, selected, color, small} = @props

      color = rgbColor color
      color = switch
        when selected then color
        when @pointerIsDown then color.blend "white", .5
        else "white"

      Element
        size: wcw:1, hch: 1
        cursor: "pointer"
        on: @buttonHandlers
        animators: size: toFrom: hch: 1, w: 0
        clip: true
        RectangleElement
          inFlow: false
          color: color
          animators:
            color: {}
            shadow: duration: .3
          padding: 3
          radius: if small then 100 else 2
          shadow:
            if @pointerIsDown || (selected && !@hover)
              blur: 4, color: "#0002", offset: y: 1
            else if @hover
              blur: 12, color: "#0004", offset: y: 2
            else
              blur: 8, color: "#0002", offset: y: 2
        if emoji
          Element
            size: 100
            padding: 18
            TextElement
              text: emoji
              location: ps: .5
              axis: "centerCenter"
              scale: (ps, cs) -> ps.div(cs).min()
              layoutMode: "tight"
              fontSize: 64
        else
          TextElement StyleProps.textStyle,
            size: cs:1
            align: "centerCenter"
            text: text
            padding: if small then 15 else 20

        subtext &&
          TextElement StyleProps.textStyle,
            fontSize: 10
            location: ww:.5, yh: 1, y:-8
            size: cs:1
            axis: "bottomCenter"
            text: subtext
