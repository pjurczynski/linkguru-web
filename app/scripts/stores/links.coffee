Reflux = require 'reflux'

module.exports = Reflux.createStore
  init: ->
    @listenToMany Window.Actions.links
