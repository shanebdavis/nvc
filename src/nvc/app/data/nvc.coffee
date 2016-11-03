Foundation = require 'art-foundation'
{HotStyleProps} = require 'art-react'

{defineModule, log, arrayToFalseMap, wordsArray, deepMap, w} = Foundation

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
    metabolism:         "Plenty of air, food, water and sleep."
    health:             "Feeling 100% well, or healing and on the way to full recovery."
    energy:             "Rested, restored, energized and vital."

    environment:        "Comfortable temperature, humidity, atmosphere, clothing and shelter."
    "physical-safety":  "Living free from violence, accidents, illness and disasters."
    security:           "Life is stable, predictable, and sustainable."
    procreation:        "The need to have children."

  thriving:
    enjoyment:
      senses:           "Pleasure of the senses: sight, smell, touch, sound, and taste.\n\nExamples: beautiful sight, lovely fragrance, pleasurable texture, calming or energizing or inspiring music, delicious food and drink"
      body:             "Exercise, fitness, movement, dance, sex or eroticism."
      variety:          "Variety is the spice of life."
      comfort:          "Quiet, space, sanctuary, ergonomics, leisure and time."

      play:             "Plenty of adventure, excitement, fantasy, fun, humor, joy and laughter."

    social:
      sharing:          "experiences, interests, values"
      physical_bonding: "Hugs, touch, cuddles and sexual-connection."
      closeness:        "Close relationships with friends, family and lovers. A sense of openness, good communication, intimate sharing, companionship,
                        and feeling free to be 100% oneself in the presence of others."
      balance:          "A sense of balance in understanding and effort in our relationships."
      belonging:        "Accepted, acknowledged, included and equal."
      participation:    "Collaboration, cooperation, service and sharing."
      appreciation:     "Valued, recognized, and wanted."

      nurturing:        "Giving and receiving: care, help, kindness, affection, support and supportive feedback."
      understanding:    "Understanding and being understood: empathized, heard, known, seen and respected."
      compassion:               "Giving and receiving compassion: attention, consideration, forgiveness, presence, tenderness,
                                vulnerability and love."

      social_safety:    "The need for consistency, honesty, justice, privacy, reassurance, and trust in our relationships."

  transcending:
    self_acceptance:    "Accept and love oneself fully. Allow, approve, care, have empathy and compassion for oneself. Be honest with, and trust oneself."
    self_awareness:     "Know oneself at ever deeper levels."
    self_growth:        "Intentionally and continually improve oneself."
    self_expression:    "Create and be creative. Imagine, innovate and invent. Actualize and realize ones dreams fully."

    self_respect:       "Respect oneself and be worthy of others' respect: responsible, authentic, confident, courageous, dignified, honorable, honest,
                        worthy and always acting with integrity."

    autonomy:           "Feeling enabled, empowered and challenged. Feeling free to make our own choices. Given complete flexibility.
                        Feeling limitless, full of possibility and full of potential."

    engagement:         "Regularly engaging in flow, mindfulness and gratitude."
    mastery:            "Competent, efficient and effective. Constantly improving, feeling more and more skillful and masterful."
    meaning:            "Understanding, deepening that understanding and celebrating life, the universe and everything. Ingredients: perspective, awareness, celebration, deepening, discovery,
                        exploration, legacy and spirituality."

    peace:              "A feeling of ease, balance, clarity, faith, grace, harmony, hope, order, structure,
                        tranquility, beauty, unity and oneness."

    purpose:            "Having a greater purpose. To have impact, importance,
                        do something that matters, and contribute something of significance. To have dedication, inspiration, passion and vision. To have dream vividly of something better. "

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

    fatigue:
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
