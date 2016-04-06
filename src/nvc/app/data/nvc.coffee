Foundation = require 'art-foundation'
{HotStyleProps} = require 'art-react'

{log, arrayToFalseMap} = Foundation

splitOnLines = (str) -> str.split "\n"

module.exports = class Nvc extends HotStyleProps
  @categories: ["needs", "posEmotions" ,"negEmotions"]
  @needs:
    connection:
      arrayToFalseMap splitOnLines """
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
      inclusion
      intimacy
      love
      mutuality
      nurturing
      respect/self-respect
      safety
      security
      stability
      support
      to know and be known
      to see and be seen
      to understand and be understood
      trust
      warmth
      """

    "physical well being":
      arrayToFalseMap splitOnLines """
      air
      food
      movement/exercise
      rest/sleep
      sexual expression
      safety
      shelter
      touch
      water
      """

    honesty:
      arrayToFalseMap splitOnLines """
      authenticity
      integrity
      presence
      """

    play:
      arrayToFalseMap splitOnLines """
      joy
      humor
      """

    peace:
      arrayToFalseMap splitOnLines """
      beauty
      communion
      ease
      equality
      harmony
      inspiration
      order
      """

    autonomy:
      arrayToFalseMap splitOnLines """
      choice
      freedom
      independence
      space
      spontaneity
      """

    meaning:
      arrayToFalseMap splitOnLines """
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
      """

  @posEmotions:
    affectionate:
      arrayToFalseMap splitOnLines """
      compassionate
      friendly
      loving
      open hearted
      sympathetic
      tender
      warm
      """

    engaged:
      arrayToFalseMap splitOnLines """
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
      """

    hopeful:
      arrayToFalseMap splitOnLines """
      expectant
      encouraged
      optimistic
      """

    confident:
      arrayToFalseMap splitOnLines """
      empowered
      open
      proud
      safe
      secure
      """

    excited:
      arrayToFalseMap splitOnLines """
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
      """

    grateful:
      arrayToFalseMap splitOnLines """
      appreciative
      moved
      thankful
      touched
      """

    inspired:
      arrayToFalseMap splitOnLines """
      amazed
      awed
      wonder
      """

    joyful:
      arrayToFalseMap splitOnLines """
      amused
      delighted
      glad
      happy
      jubilant
      pleased
      tickled
      """

    exhilarated:
      arrayToFalseMap splitOnLines """
      blissful
      ecstatic
      elated
      enthralled
      exuberant
      radiant
      rapturous
      thrilled
      """

    peaceful:
      arrayToFalseMap splitOnLines """
      calm
      clear headed
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
      """

  @negEmotions:
    afraid:
      arrayToFalseMap splitOnLines """
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
      """

    annoyed:
      arrayToFalseMap splitOnLines """
      aggravated
      dismayed
      disgruntled
      displeased
      exasperated
      frustrated
      impatient
      irritated
      irked
      """

    angry:
      arrayToFalseMap splitOnLines """
      enraged
      furious
      incensed
      indignant
      irate
      livid
      outraged
      resentful
      """

    aversion:
      arrayToFalseMap splitOnLines """
      animosity
      appalled
      contempt
      disgusted
      dislike
      hate
      horrified
      hostile
      repulsed
      """

    confused:
      arrayToFalseMap splitOnLines """
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
      """

    disconnected:
      arrayToFalseMap splitOnLines """
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
      """

    disquiet:
      arrayToFalseMap splitOnLines """
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
      """

    embarrassed:
      arrayToFalseMap splitOnLines """
      ashamed
      chagrined
      flustered
      guilty
      mortified
      self-conscious
      """

    fatigue:
      arrayToFalseMap splitOnLines """
      beat
      burnt out
      depleted
      exhausted
      lethargic
      listless
      sleepy
      tired
      weary
      worn out
      """

    pain:
      arrayToFalseMap splitOnLines """
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
      """

    sad:
      arrayToFalseMap splitOnLines """
      depressed
      dejected
      despair
      despondent
      disappointed
      discouraged
      disheartened
      forlorn
      gloomy
      heavy hearted
      hopeless
      melancholy
      unhappy
      wretched
      """

    tense:
      arrayToFalseMap splitOnLines """
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
      """

    vulnerable:
      arrayToFalseMap splitOnLines """
      fragile
      guarded
      helpless
      insecure
      leery
      reserved
      sensitive
      shaky
      """

    yearning:
      arrayToFalseMap splitOnLines """
      envious
      jealous
      longing
      nostalgic
      pining
      wistful
      """

  @core:
    needs: @needs
    posEmotions: @posEmotions
    negEmotions: @negEmotions
