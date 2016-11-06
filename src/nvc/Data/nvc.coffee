Foundation = require 'art-foundation'
{HotStyleProps} = require 'art-react'

{defineModule, log, arrayToFalseMap, wordsArray, deepMap, w, peek} = Foundation

splitOnLines = (str) -> str.split "\n"

normalizeList = (string) ->
  list = w string
  list.sort()
  list.join ', '

###
 unsorted needs:

   quality
   mourning
###
sbdNeedsList =
  surviving:
    sustenance:         "Getting all the healthy food and clean water the body needs."
    sleep:              """
                        Getting pleanty of sleep. Waking every day fully rested and alive.

                        adult: 7.5 to 9 hours
                        teen: 9 to 9.5 hours
                        """

    comfortable_climate:
                        """
                        At work, at home and everywhere in between:

                        Cozy and warm when it's cold outside,
                        Shady and cool when it's hot,
                        Dry and clean when it's wet,
                        Moist and refreshed when it's dry.
                        """
                        # "clothing and shelter."

    health:             "Feeling 100% well, or healing and on the way to full recovery."
    energy:             "Rested, restored, energized and vital."
    physical_safety:    "Living free from violence, accidents, illness and disasters."
    security:           "Life is stable, predictable, and sustainable."
    children:           "Have, or are working on having all the children one wants."
    ergonomics:         """
                        All the built-things around me support my body's health and comfort. Examples:

                        bathroom: toilet, sink, shower, bathtub
                        clothing: shoes, underwear, coat, hat, glasses
                        creation: writing and art tools
                        exercise: equipment, shoes, clothing
                        kitchen: counters, cabinetts, tools
                        rest: couch, bed, pillows
                        work: chair, desk, keyboard, monitor
                        """

  thriving:
    enjoyment:
      pleasure:         """
                        Plenty of Exercise, fitness, movement, dance, sex and eroticism. All five senses are simulated and alive.

                        Pleasurable stimulation: beautiful sights, lovely fragrances, pleasurable textures, calming or energizing or inspiring music, delicious food and drink
                        """
      variety:          "Plenty of variety and novelty."
      leisure:          "Plenty of quiet, relaxing, comfortable, space and time."

      play:             "Plenty of adventure, excitement, fantasy, fun, humor, joy and laughter."

    social:
      sharing:          "For each important experience, interest and value, having plenty of people who understand and share ones passions."
      physical_bonding: "Plenty of hugs, touch, cuddles and sexual-connection."
      closeness:        "Plenty of close, meaningful relationships with friends, family and lovers. A sense of openness, good communication, intimate sharing, companionship,
                        and feeling free to be 100% oneself with those people."
      social_balance:   "All important relationships are balanced and mutual."
      belonging:        "Accepted, acknowledged, included and equal."
      participation:    "Plenty of collaboration, cooperation, opportunities for service and sharing."
      appreciation:     "Valued, recognized, and wanted."

      nurturing:        "Receiving all the care, help, kindness, affection, support and helpful feedback one needs."
      understanding:    "Feeling completely understood by those who matter: empathized, heard, known, seen and respected."
      compassion:       "Receiving all the attention, consideration, forgiveness, presence, tenderness,
                        vulnerability and love one needs."

      social_safety:    """
                        All important relationships are reliable, honest, and full of mutual trust.

                        All relationships, of any kind, are consensual, just, respecting of privacy, respecting of boundaries and completely safe.
                        """

  transcending:
    self_acceptance:    """
                        Accept and love oneself

                        Allow, approve, care, have empathy and compassion for oneself

                        Trust and honest with oneself
                        """

    self_awareness:     """
                        Know oneself at ever deeper levels.

                        Needs and emotional awareness

                        Know one's genius, strengths and weaknesses

                        Know what does and doesn't work fulfilling one's own needs.
                        """

    self_growth:        "Intentionally and continually improve oneself."

    self_expression:    """
                        Create and be creative.

                        Imagine, innovate and invent.

                        Actualize and realize ones dreams fully.
                        """

    self_respect:       """
                        Respect oneself and be worthy of others' respect.

                        Ingredients: responsible, authentic, confident, courageous, dignified, honorable, honest, worthy, always acting with integrity
                        """

    autonomy:           """
                        Feeling enabled, empowered and challenged.

                        Feeling free to make ones own choices and be spontaneous. Given complete flexibility.

                        Feeling limitless, full of possibility and full of potential.
                        """

    engagement:         "Plenty of flow, mindfulness and gratitude."

    mastery:            "Competent, efficient and effective. Constantly improving, feeling ever more skillful and masterful."

    meaning:            """
                        Ever deepening understanding and celebration of life, the universe and everything.

                        Ingredients: perspective, awareness, celebration, deepening, discovery, exploration, legacy and spirituality.
                        """

    peace:              "Complete ease, balance, clarity, faith, grace, sanctuary, harmony, hope, order, structure,
                        tranquility, beauty, unity and oneness with the universe."

    purpose:            """
                        Have a greater purpose.

                        Have impact, importance, do something that matters, and contribute something of significance.

                        Have dedication, inspiration, passion and vision.

                        Dream vividly of a better world and a better life.
                        """

# TODO: use babelbridge to write a parser




defineModule module, class Nvc extends HotStyleProps
  @categories: ["needs", "posEmotions" ,"negEmotions"]
  @needs: sbdNeedsList #deepMap sbdNeedsList, (el) -> el.match /[-_0-9a-z]+/gi

  @nvcNeeds:
    "connection a-h":
      "
      acceptance
      affection
      appreciation
      belonging
      cooperation
      communication
      closeness
      community
      companionship
      compassion
      consideration
      consistency
      empathy
      "
    "connection i-z":
      "
      inclusion
      intimacy
      love
      mutuality
      nurturing
      respect
      self-respect
      safety
      security
      stability
      support
      to know
      to be known
      to see
      to be seen
      to understand
      to be understood
      trust
      warmth
      "

    "physical well being":
      "
      air
      food
      movement/exercise
      rest/sleep
      sexual expression
      safety
      shelter
      touch
      water
      "

    honesty:
      "
      authenticity
      integrity
      presence
      "

    play:
      "
      joy
      humor
      "

    peace:
      "
      beauty
      communion
      ease
      equality
      harmony
      inspiration
      order
      "

    autonomy:
      "
      choice
      freedom
      independence
      space
      spontaneity
      "

    meaning:
      "
      awareness
      celebration of life
      challenge
      clarity
      competence
      consciousness
      contribution
      creativity
      discovery
      efficacy
      effectiveness
      growth
      hope
      learning
      mourning
      participation
      purpose
      self-expression
      stimulation
      to matter
      understanding
      "

  @posEmotions:
    affectionate:
      normalizeList "
      compassionate
      friendly
      loving
      open-hearted
      sympathetic
      tender
      warm
      "

    engaged:
      normalizeList "
      absorbed
      alert
      curious
      engrossed
      enchanted
      entranced
      fascinated
      interested
      intrigued
      involved
      spellbound
      stimulated
      "

    hopeful:
      normalizeList "
      expectant
      encouraged
      optimistic
      "

    confident:
      normalizeList "
      empowered
      open
      proud
      safe
      secure
      "

    excited:
      normalizeList "
      amazed
      animated
      ardent
      aroused
      astonished
      dazzled
      eager
      energetic
      enthusiastic
      giddy
      invigorated
      lively
      passionate
      surprised
      vibrant
      "

    grateful:
      normalizeList "
      appreciative
      moved
      thankful
      touched
      "

    inspired:
      normalizeList "
      amazed
      awed
      wonder
      "

    joyful:
      normalizeList "
      amused
      delighted
      glad
      happy
      jubilant
      pleased
      tickled
      "

    exhilarated:
      normalizeList "
      blissful
      ecstatic
      elated
      enthralled
      exuberant
      radiant
      rapturous
      thrilled
      "

    peaceful:
      normalizeList "
      calm
      clear-headed
      comfortable
      centered
      content
      equanimous
      fulfilled
      mellow
      quiet
      relaxed
      relieved
      satisfied
      serene
      still
      tranquil
      trusting
      "

  @negEmotions:
    afraid:
      normalizeList "
      apprehensive
      dread
      foreboding
      frightened
      mistrustful
      panicked
      petrified
      scared
      suspicious
      terrified
      wary
      worried
      "

    annoyed:
      normalizeList "
      aggravated
      dismayed
      disgruntled
      displeased
      exasperated
      frustrated
      impatient
      irritated
      irked
      "

    angry:
      normalizeList "
      enraged
      furious
      incensed
      indignant
      irate
      livid
      outraged
      resentful
      "

    aversion:
      normalizeList "
      animosity
      appalled
      contempt
      disgusted
      dislike
      hate
      horrified
      hostile
      repulsed
      "

    confused:
      normalizeList "
      ambivalent
      baffled
      bewildered
      dazed
      hesitant
      lost
      mystified
      perplexed
      puzzled
      torn
      "

    disconnected:
      normalizeList "
      alienated
      aloof
      apathetic
      bored
      cold
      detached
      distant
      distracted
      indifferent
      numb
      removed
      uninterested
      withdrawn
      "

    disquiet:
      normalizeList "
      agitated
      alarmed
      discombobulated
      disconcerted
      disturbed
      perturbed
      rattled
      restless
      shocked
      startled
      surprised
      troubled
      turbulent
      turmoil
      uncomfortable
      uneasy
      unnerved
      unsettled
      upset
      "

    embarrassed:
      normalizeList "
      ashamed
      chagrined
      flustered
      guilty
      mortified
      self-conscious
      "

    fatigued:
      normalizeList "
      beat
      burnt-out
      depleted
      exhausted
      lethargic
      listless
      sleepy
      tired
      weary
      worn-out
      "

    pain:
      normalizeList "
      agony
      anguished
      bereaved
      devastated
      grief
      heartbroken
      hurt
      lonely
      miserable
      regretful
      remorseful
      "

    sad:
      normalizeList "
      depressed
      dejected
      despair
      despondent
      disappointed
      discouraged
      disheartened
      forlorn
      gloomy
      heavy-hearted
      hopeless
      melancholy
      unhappy
      wretched
      "

    tense:
      normalizeList "
      anxious
      cranky
      distressed
      distraught
      edgy
      fidgety
      frazzled
      irritable
      jittery
      nervous
      overwhelmed
      restless
      stressed out
      "

    vulnerable:
      normalizeList "
      fragile
      guarded
      helpless
      insecure
      leery
      reserved
      sensitive
      shaky
      "

    yearning:
      normalizeList "
      envious
      jealous
      longing
      nostalgic
      pining
      wistful
      "

  @core:
    needs: @needs
    posEmotions: @posEmotions
    negEmotions: @negEmotions

  @getNotSelectedStatement: (path) ->
    if path[0] == "needs"
      "I have all the #{peek path} I need."
    else
      "I am feeling neutral."

  @getSelectedStatement: (path) ->
    if path[0] == "needs"
      "I need more #{peek path}."
    else
      "I am feeling #{peek path}."

