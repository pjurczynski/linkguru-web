Reflux = require 'reflux'

linksStore = Reflux.createStore
  init: ->
    @listenToMany Window.Actions.links

  state:
    list: []
  onAdd: (payload) ->
    @state.list.push(url: payload.url)
    @trigger(@state)

  onUpVote: (link) ->
    return true if link.upVoted
    link.score += if link.downVoted then 2 else 1
    link.upVoted = true
    link.downVoted = false
    @trigger(@state)

  onDownVote: (link) ->
    return true if link.downVoted
    link.score -= if link.upVoted then 2 else 1
    link.downVoted = true
    link.upVoted = false
    @trigger(@state)

  getState: ->
    @state

module.exports = linksStore
