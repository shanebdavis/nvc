{defineModule, Component, Element, TextElement, FillElement, RectangleElement, log} = require 'art-suite'
{StyleProps} = Neptune.Nvc.App.Styles

defineModule module, ->

  emojiMap =
    needs: "🌳"
    negEmotions: "☹️"
    posEmotions: "😀"

  subtextMap =
    needs: "needs"
    negEmotions: "emotions"
    posEmotions: "emotions"
    surviving: "animal"
    thriving: "mamal"
    transcending: "human"

  class CategoryButton extends Component

    drillIn: ->
      {category, subMap, drillIn} = @props
      if subMap
        drillIn category, subMap

    buttonDown: -> @setState buttonDown: true
    buttonUp: -> @setState buttonDown: false
    mouseIn: -> @setState mouseIn: true
    mouseOut: -> @setState mouseIn: false

    render: ->
      {category, subMap, selected, color, indent} = @props
      {buttonDown, mouseIn} = @state
      color = if selected then StyleProps.primaryColor else "white"
      indent ||= 0

      subtext = subtextMap[category]

      Element
        size: wcw:1, hch: 1
        cursor: "pointer"
        on:
          pointerUpInside:  @drillIn
          pointerDown:      @buttonDown
          pointerUp:        @buttonUp
          pointerOut:       @buttonUp
          pointerIn:        @buttonDown
          mouseIn:          @mouseIn
          mouseOut:         @mouseOut
        RectangleElement
          inFlow: false
          color: color
          animators:
            color: {}
            shadow: duration: .3
          padding: 3
          radius: 2
          shadow:
            if buttonDown || selected
              null
            else if mouseIn
              blur: 16, color: "#0006", offset: y: 2
            else
              blur: 8, color: "#0002", offset: y: 2
        if emojiText = emojiMap[category]
          Element
            size: 100
            padding: 18
            TextElement
              text: emojiText
              location: ps: .5
              axis: "centerCenter"
              scale: (ps, cs) -> ps.div(cs).min()
              layoutMode: "tight"
              fontSize: 64
              # RectangleElement color: "yellow"
              # FillElement()
        else
          TextElement StyleProps.textStyle,
            size: cs:1
            align: "centerCenter"
            text: category
            padding: if subMap then 20 else 15

        subtext &&
          TextElement StyleProps.textStyle,
            fontSize: 10
            location: ww:.5, yh: 1, y:-8
            size: cs:1
            axis: "bottomCenter"
            text: subtext
