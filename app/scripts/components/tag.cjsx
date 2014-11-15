React = require 'react/addons'
Reflux = require 'reflux'

cx = React.addons.classSet
actions = Window.Actions.tags
tagsStore = Window.Stores.tags
LinkComponent = require './link'

Tag = React.createClass
  mixins: [Reflux.listenTo(tagsStore, "onlinksStateChange")]

  componentWillReceiveProps: (props) ->
    if @props.params.name != props.params.name
      actions.select(props.params.name)

  componentWillMount: ->
    actions.select(@props.params.name)

  componentWillUnmount: ->
    actions.select("")

  getInitialState: ->
    tag: tagsStore.getState().selected

  onlinksStateChange: (state) ->
    @setState(tag: state.selected)

  render: ->
    <div className='row'>
      {
        if @state.tag
          @state.tag.links?.map (link, i) ->
            <LinkComponent key=i link={link}/>
        else
          <div className='alert alert-warning'>tag not found... make sure you url is valid!</div>
      }
    </div>


module.exports = Tag
