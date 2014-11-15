React = require 'react/addons'
Reflux = require 'reflux'
_ = require 'underscore'

cx = React.addons.classSet

TagNav = require './tag_nav'

tagsStore = Window.Stores.tags

Tags = React.createClass
  mixins: [Reflux.listenTo(tagsStore, "onlinksStateChange")]

  getInitialState: ->
    tags: tagsStore.state.tags

  onlinksStateChange: (state) ->
    @setState(state)

  render: ->
    <div className='tags-component'>
      <div className='col-xs-3 navigation' style={height: (window.innerHeight-50), 'overflow-y': 'auto'}>
        <ul className='nav nav-pills nav-stacked'>
          {
            _(@state.tags).map (tag, i) ->
              <TagNav key=i tag={tag}/>
          }
        </ul>
      </div>
      <div className='col-xs-9 tag-links' style={height: (window.innerHeight-50), 'overflow-y': 'auto', 'overflow-x': 'hidden'}>
        <@props.activeRouteHandler/>
      </div>
    </div>


module.exports = Tags
