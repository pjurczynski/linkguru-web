Reflux = require 'reflux'
_ = require 'underscore'


tagsStore = (linksStore) -> Reflux.createStore
  init: ->
    @listenTo linksStore, @handleLinksChange
    @listenToMany window.Actions.tags

  state:
    tags: {}
    selected: ''

  handleLinksChange: (state) ->
    tags: {}
    @state.tags = {}
    _(state.list).each (link) =>
      _(link.tags).each (tagName) =>
        tag = @state.tags[tagName] ||= { name: tagName, selected: false }
        tag.link_ids ||= []
        tag.link_ids.push(link.id)
        @state.tags[tagName] = tag
        # @state.tags[tagName].linkIds

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
    selected = @state.tags[@state.selected]
    if selected?
      selected.links = _.uniq(selected.link_ids).map (id) -> linksStore.all()[id]
    selected

exports.agregate = (linksStore) -> tagsStore(linksStore)
