Reflux = require 'reflux'

linksStore = Reflux.createStore
  init: ->
    @listenToMany Window.Actions.links

    @list = []

  onAdd: (payload) ->
    @list.push(payload)
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


module.exports = linksStore
