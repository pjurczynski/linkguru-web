Reflux = require 'reflux'
faker = require 'faker'

linksStore = Reflux.createStore
  init: ->
    @listenToMany Window.Actions.links

    @list = []

  onAdd: (payload) ->
    @list.unshift(payload)
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
    list: @list

  fakeData: ->
    @list = [1..50].map (i) ->
      tags = [1..faker.helpers.randomNumber(5)].map ->
        faker.hacker.noun()
      {
        id: i
        url: "http://google.pl/search?q=#{faker.lorem.words(1)[0]}"
        score: faker.helpers.randomNumber(200)
        tags: tags
        downVoted: faker.helpers.randomNumber(1) == 1
        upVoted: faker.helpers.randomNumber(1) == 1
        description: faker.lorem.sentences()
        owner:
          email: faker.internet.email()
      }

  onFetch: ->
    setTimeout( =>
      @fakeData()
      @trigger @getState()
    , 500)


module.exports = linksStore
