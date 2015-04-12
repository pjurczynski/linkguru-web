Reflux = require 'reflux'
faker = require 'faker'
lunr = require 'lunr'
_ = require 'underscore'
linksApi = window.Api.links

linksStore = Reflux.createStore
  init: ->
    @listenToMany window.Actions.links

    @list = []
    @search = null
    @lunr = lunr ->
      @ref('id')
      @field('url')
      @field('tag_list', 10)
      @field('description')


  onAdd: (payload) ->
    linksApi.add(payload).then (resposne) =>
      link = resposne.data
      @lunr.add(link)
      @list.unshift(link)
      @trigger @getState()

  onSearch: (query) ->
    if query.length > 2
      ids = @lunr.search(query).map (ref) -> ref.ref

      @search = @list.filter (el) ->
        _(ids).contains String(el.id)
    else
      @search = null
    @trigger @getState()

  onUpVote: (link) ->
    return true if link.upVoted
    link.score += if link.downVoted then 2 else 1
    link.upVoted = true
    link.downVoted = false
    linksApi.upVote(link).then (response) ->
      link.score = response.data.score
      @trigger @getState()
    @trigger @getState()
    @trigger @getState()

  onDownVote: (link) ->
    return true if link.downVoted
    link.score -= if link.upVoted then 2 else 1
    link.downVoted = true
    link.upVoted = false
    linksApi.downVote(link).then (response) ->
      link.score = response.data.score
      @trigger @getState()
    @trigger @getState()

  getState: (payload) ->
    list: @search || _(@array()).sortBy('created_at').reverse()
    payload: payload

  all: ->
    @list

  array: ->
    _(@list).toArray()

  get: (id) ->
    @list[id]

  onFetch: ->
    linksApi.all().then (response) =>
      response.data.forEach (link) =>
        @lunr.add(link)
      @list = _(response.data).indexBy('id')
      @trigger @getState()


module.exports = linksStore
