Foundation = require 'art-foundation'
{HotStyleProps} = require 'art-react'

{log, arrayToFalseMap, wordsArray, deepMap} = Foundation

splitOnLines = (str) -> str.split "\n"

sbdNeedsList =
  surviving:
    "body":
      sustanence:             "air, food, water"
      "health":               "wellbeing, wellness, healing, regeneration, rejuvenation"
      "energy":               "rest, restoration, sleep, vitality"
    "environment":            "temperature, warmth, coolness, humidity, toxin-free, pathogen-free, clothes, shelter"
    safety:                   "violence, accidents, illness, disasters"
    security:                 "stability predictability sustainability"
    procreation:              "sexual-release children"

  thriving:
    pleasure:
      senses:                 "music, food, fragrance, texture, art touch, smell, hear, taste, see"
      body:                   "eroticisim, exercise, fitness, movement, dance, sex"
      variety:                "newness, novelty"
      comfort:                "quiet, space, sanctuary, ergonomics, leisure, time"

    play:                     "adventure, excitement, fantasy, fun, humor, joy, laughter"

    social:
      bonding:                "common-experience, common-interests, common-values, connection, hug, sexual-connection, embracing, touch, openness, closeness, communication, communion, companionship, friendship, relationship, intimacy, mourning, partnership, mutuality, balance"

      community:
        belonging:            "accepted, acknowledged, included, equal"
        participation:        "collaboration, cooperation, service, sharing"
        appriciation:         "valued, recognized, wanted"

      reciprocity:
        nurturing:            "care, feedback, help, kindness, support, affection"
        understanding:        "listening, empathy, knowing, seeing"
        compassion:           "attention, consideration, forgiveness, presence, respect, tenderness, vulnerability, love"

      safety:                 "consistency, honesty, justice, reassurance, trust"

  transcending:
    "self-acceptance":        "allowing, approval, empathy, love, compassion, caring"
    "self-awareness":         "consciousness, discovery, honesty, knowledge"
    "self-growth":            "evolution, integration, development, improvement"
    "self-expression":        "creativity, creation, imagination, invention, innovation, actualization, realization"
    "self-respect":           "esteem, responsible, authentic, courageous, dignified, honorable, integrity, worthy"

    meaning:                  "perspective, learning, awareness, celebration, depth, discovery, exploration, legacy, quality, spirituality, unity, oneness, beauty"

    peace:                    "ease, balance, clarity, faith, grace, harmony, hope, idleness, order, privacy, structure, tranquility"

    engagement:               "flow, gratitude, practice"
    autonomy:                 "challenged, choice, empowered, enabled, flexibility, freedom, intention, liberty, limitless, possibility, potential, responsibility"
    purpose:                  "contribute, dedicated, dreams, enrich, impact, important, inspired, matter, passionate, significant, vision"
    mastery:                  "competent, effective, efficient, skillful"

# TODO: use babelbridge to write a parser




module.exports = class Nvc extends HotStyleProps
  @categories: ["needs", "posEmotions" ,"negEmotions"]
  @needs: deepMap sbdNeedsList, (el) -> el.match /[-_0-9a-z]+/gi

  @nvcNeeds:
    "connection a-h":
      wordsArray """
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
      """
    "connection i-z":
      wordsArray """
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
      """

    "physical well being":
      wordsArray """
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
      wordsArray """
      authenticity
      integrity
      presence
      """

    play:
      wordsArray """
      joy
      humor
      """

    peace:
      wordsArray """
      beauty
      communion
      ease
      equality
      harmony
      inspiration
      order
      """

    autonomy:
      wordsArray """
      choice
      freedom
      independence
      space
      spontaneity
      """

    meaning:
      wordsArray """
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
      wordsArray """
      compassionate
      friendly
      loving
      open hearted
      sympathetic
      tender
      warm
      """

    engaged:
      wordsArray """
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
      wordsArray """
      expectant
      encouraged
      optimistic
      """

    confident:
      wordsArray """
      empowered
      open
      proud
      safe
      secure
      """

    excited:
      wordsArray """
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
      wordsArray """
      appreciative
      moved
      thankful
      touched
      """

    inspired:
      wordsArray """
      amazed
      awed
      wonder
      """

    joyful:
      wordsArray """
      amused
      delighted
      glad
      happy
      jubilant
      pleased
      tickled
      """

    exhilarated:
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
      wordsArray """
      ashamed
      chagrined
      flustered
      guilty
      mortified
      self-conscious
      """

    fatigue:
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
      wordsArray """
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
