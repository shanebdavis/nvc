Foundation = require 'art-foundation'
{HotStyleProps} = require 'art-react'

{defineModule, log, arrayToFalseMap, wordsArray, deepMap, w, peek} = Foundation

splitOnLines = (str) -> str.split "\n"

normalizeList = (string) ->
  list = w string
  list.sort()
  list.join ', '

defineModule module, class Nvc extends HotStyleProps
  @categories: ["needs", "posEmotions" ,"negEmotions"]

  @needs: require './needs'

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
    last = peek(path).replace /_/g, ' '
    if path[0] == "needs"
      "I have all the #{last} I need."
    else
      "I am feeling neutral."

  @getSelectedStatement: (path) ->
    last = peek(path).replace /_/g, ' '
    if path[0] == "needs"
      "I need more #{last}."
    else
      "I am feeling #{last}."

