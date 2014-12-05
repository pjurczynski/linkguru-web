Reflux = require 'reflux'
faker = require 'faker'
lunr = require 'lunr'
_ = require 'underscore'


linksStore = Reflux.createStore
  init: ->
    @listenToMany Window.Actions.links

    @list = {}
    @search = null
    @lunr = lunr ->
      @ref('id')
      @field('url')
      @field('tags', 10)
      @field('description')


  onAdd: (payload) ->
    @list.unshift(payload)
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
    @trigger @getState()

  onDownVote: (link) ->
    return true if link.downVoted
    link.score -= if link.upVoted then 2 else 1
    link.downVoted = true
    link.upVoted = false
    @trigger @getState()

  getState: (payload) ->
    list: @search || @list
    payload: payload

  fakeData: ->
    @list = [1..50].map (i) ->
      tags = [1..faker.helpers.randomNumber(5)].map ->
        faker.hacker.noun()
      link = {
        id: i
        url: "http://google.pl/search?q=#{faker.lorem.words(1)[0]}"
        score: faker.helpers.randomNumber(200)
        tags: tags
        downVoted: faker.helpers.randomNumber(1) == 1
        upVoted: faker.helpers.randomNumber(1) == 1
        description: faker.lorem.sentence()
        owner:
          email: faker.internet.email()
      }
      return link
    links

  all: ->
    _(@list).indexBy('id')

  onFetch: ->
    data = @fakeData()
    data.forEach (link) =>
      @lunr.add(link)
    @list = data
    @trigger @getState()


module.exports = linksStore
