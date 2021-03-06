React = require 'react'
Reflux = require 'reflux'
linksStore = window.Stores.links

LinksList = require './links_list'
Authentication = require './../mixins/authentication'

Links = React.createClass
  mixins: [Reflux.listenTo(linksStore, "onlinksStateChange"), Authentication]

  getInitialState: ->
    linksStore.getState()

  onlinksStateChange: (state) ->
    @setState(state)

  render: ->
    <LinksList links={@state.list} currentPage={@props.currentPage} route={@props.route || 'links'}/>


module.exports = Links
