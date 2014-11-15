Reflux = require 'reflux'
_ = require 'underscore'

tagsStore = (linksStore) -> Reflux.createStore
  init: ->
    @listenTo linksStore, @handleLinksChange
    @listenToMany Window.Actions.tags

  state:
    tags: {}
    selected: ""

  handleLinksChange: (state) ->
    _(state.list).each (link) =>
      _(link.tags).each (tagName) =>
        tag = @state.tags[tagName] ||= { name: tagName, selected: false }
        array = tag.links ||= []
        array.push(link)
        @state.tags[tagName].links = _.uniq(array)

    @state.loading = state.loading
    @trigger(@getState())

  onSelect: (tagName) ->
    @state.selected = tagName
    @trigger(@getState())

  getState: ->
    tags: @state.tags
    selected: @getSelected()


  getSelected: ->
    _(@state.tags).each (tag) =>
      tag.selected = (tag.name == @state.selected)
    @state.tags[@state.selected]

exports.agregate = (linksStore) -> tagsStore(linksStore)
