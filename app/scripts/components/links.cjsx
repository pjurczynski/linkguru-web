React = require 'react'

Reflux = require 'reflux'
linksStore = Window.Stores.links

LinkComponent = require './link'

Links = React.createClass
  mixins: [Reflux.listenTo(linksStore, "onlinksStateChange")]

  getInitialState: ->
    linksStore.getState()

  onlinksStateChange: (state) ->
    @setState(state)

  render: ->
    <div className='links-component'>
      {
        @state.list.map (link, i) =>
          <LinkComponent key=i link={link}/>
      }
    </div>

module.exports = Links
