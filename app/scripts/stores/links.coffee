Reflux = require 'reflux'

module.exports = Reflux.createStore
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

  getState: ->
    @state
