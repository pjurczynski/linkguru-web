React = require 'react/addons'
Reflux = require 'reflux'

cx = React.addons.classSet
actions = Window.Actions.tags
tagsStore = Window.Stores.tags
LinksList = require './links_list'
Router = require 'react-router'
Link = Router.Link

Tag = React.createClass
  mixins: [Reflux.listenTo(tagsStore, "onTagsStateChange")]

  componentWillReceiveProps: (props) ->
    if @props.params.name != props.params.name
      actions.select(props.params.name)

  componentWillMount: ->
    actions.select(@props.params.name)

  componentWillUnmount: ->
    actions.select("")

  getInitialState: ->
    tag: tagsStore.getState().selected

  onTagsStateChange: (state) ->
    @setState(tag: state.selected)

  currentLinksPage: ->
    parseInt(@props.query?['links-page']) || 1

  render: ->
    (
      <div className='row'>
        {
          if @state.tag
            <div>
              <LinksList links={@state.tag.links} currentPage={@currentLinksPage()} route='tag'/>
            </div>
          else
            <div className='alert alert-warning'>tag not found... make sure you url is valid!</div>
        }
      </div>

    )

module.exports = Tag
