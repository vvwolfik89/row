#= require cocoon

class @CocoonLimitRelation
  options:
    linkContainer: '.links'
    addLinkSelector: '.add-link'
    nestedFieldsSelector: '.nested-fields'
    maxSize: 1

  constructor: (@container, opts = {}) ->
    if @container.length
      @options = $.extend({}, @options, opts)
      @container.on 'cocoon:after-insert', (e) =>
        @_checkToHideAddLink($(e.target))
      @container.on 'cocoon:after-remove', (e) =>
        @_checkToHideAddLink($(e.target))
      @container.find(@options.addLinkSelector).each (index, e) =>
        link = $(e)
        target = $(link.data('associationInsertionNode')) || @container
        @_checkToHideAddLink(target, false)

  _checkToHideAddLink: (target, onlyVisible = true) ->
    linkContainer = target.siblings(@options.linkContainer)
    link = if linkContainer.length
      linkContainer.find(@options.addLinkSelector)
    else
      target.siblings(@options.addLinkSelector)
    nestedSelector = if onlyVisible
      "#{@options.nestedFieldsSelector}:visible"
    else
      @options.nestedFieldsSelector
    link.toggle(target.find(nestedSelector).length < @options.maxSize)

$ ->
  $('.cocoon-limit-container').each ->
    container = $(@)
    new CocoonLimitRelation(container)