class Utilities

  # some of the utilities methods are insipred or even copied from MooTools framework

  _addEvent: (element, event, fn, useCapture = false) ->
    element.addEventListener event, fn, useCapture

  _forEach: (array, fn, bind) ->
    i = 0
    l = array.length

    while i < l
      fn.call bind, array[i], i, array if i of array
      i++

  _each: (array, fn, bind) =>
    if array
      @_forEach array, fn, bind
      array

  _pass: (fn, args = [], bind) ->
    ->
      fn.apply bind, args

  _delay: (fn, delay, bind, args = []) ->
    setTimeout @_pass(fn, args, bind), delay

  _periodical: (fn, periodical, bind, args = []) ->
    setInterval @_pass(fn, args, bind), periodical

  _setHtml: (element, string) ->
    element.innerHTML = string

  _getHtml: (element) ->
    element.innerHTML

  _empty: (element) =>
    @_setHtml element, ""

  _fireEvent: (event, text) =>
    @options[event].call(@, text, @options) if @options[event]

  _extend: (object, properties) ->
    for key, val of properties
      object[key] = val
    object

class @Typist extends Utilities

  constructor: (element, options = {}) ->

    @options =
      typist:               element
      letterSelectInterval: 60
      interval:             3000
      selectClassName:      "selectedText"

    @options = @_extend @options, options

    # elements
    @elements =
      typist: @options.typist

    # current values
    @offsets =
      current:
        index: 0
        text: ""

    @setupDefaults() if @elements.typist

  setupDefaults: =>

    # fetch all variations
    @variations = @fetchVariations @elements.typist

    # this is for later
    @newText    = []

    # set up the timer
    @timer      = @_periodical @slide, @options.interval

  slide: (forcedText) =>

    # pick the variation text
    @offsets.current.text = @variations[@offsets.current.index]

    # split it up into letters
    @offsets.current.text = @offsets.current.text.split ""

    # select text per letter
    @_each @offsets.current.text, @selectText

    # set the next index
    @offsets.current.index = @next @offsets.current.index

    @_delay =>
      @options.currentSlideIndex = @offsets.current.index
      @typeText @variations[@offsets.current.index]
    , @options.letterSelectInterval * @offsets.current.text.length

    # loop index
    if @variations.length <= @offsets.current.index
      @offsets.current.index = 0
    else if @offsets.current.index is 0
      @offsets.current.index = @variations.length
    else
      @offsets.current.index = @offsets.current.index

    # empty the array with the newly typed text
    @newText.length = 0

  next: (offset) =>
    offset = offset + 1

  fetchVariations: (element) =>
    text       = element.getAttribute "data-typist"
    value      = @_getHtml element
    variations = text.split ","
    variations.splice 0, 0, value
    variations

  selectText: (letter, index) =>
    @_delay =>
      @selectOffset (@offsets.current.text.length - index) - 1
    , index * @options.letterSelectInterval

  selectOffset: (offset) =>
    text       = @offsets.current.text
    selected   = text.slice offset, text.length
    selected   = selected.join ""
    unselected = text.slice 0, offset
    unselected = unselected.join ""

    @_setHtml @elements.typist, """#{unselected}<em class="#{@options.selectClassName}">#{selected}</em>"""

  typeText: (text) =>

    # split word into letters
    @typeTextSplit = text.split ""

    # type each letter individually
    @_each @typeTextSplit, @typeLetters

    @_fireEvent "onSlide", text

  typeLetters: (letter, index) =>
    clearInterval @timer

    # add some delay between typing letters
    @_delay =>
      @typeLetter letter, index
    , index * @options.letterSelectInterval

  typeLetter: (letter, index) =>
    @_empty @elements.typist

    @newText.push letter
    @_setHtml @elements.typist, @newText.join ""

    if @typeTextSplit.length is index + 1
      @timer = @_periodical @slide, @options.interval
