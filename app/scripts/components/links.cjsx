React = require 'react'

Reflux = require 'reflux'
linksStore = Window.Stores.links

LinksList = require './links_list'


Links = React.createClass
  mixins: [Reflux.listenTo(linksStore, "onlinksStateChange")]

  getInitialState: ->
    linksStore.getState()

  onlinksStateChange: (state) ->
    @setState(state)

  render: ->
    <LinksList links={@state.list} currentPage={@props.currentPage} route='layout'/>


module.exports = Links
