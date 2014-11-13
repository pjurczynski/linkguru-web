Reflux = require 'reflux'

module.exports = Reflux.createStore
  init: ->
    @listenToMany Window.Actions.links

  state:
    list: []
  onAdd: (payload) ->
    @state.list.push(url: payload.url)
    @trigger(@state)

  getState: ->
    @state
