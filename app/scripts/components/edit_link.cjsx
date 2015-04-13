React = require 'react/addons'
cx = React.addons.classSet
Reflux = require 'reflux'
Router = require 'react-router'
linksStore = window.Stores.links

actions = window.Actions.links

Authentication = require './../mixins/authentication'
NewLink = React.createClass
  mixins: [
    Reflux.listenTo(linksStore, "onlinksStateChange"),
    React.addons.LinkedStateMixin,
    Router.State
    Router.Navigation
  ]

  getInitialState: ->
    @getLinkFromStore()

  onlinksStateChange: ->
    @setState(@getLinkFromStore())

  getLinkFromStore: ->
    link = linksStore.get(@getParams().linkId)
    if link?
      {
        url: link.url
        description: link.description
        tagList: link.tag_list.join()
        loading: false
      }
    else
      actions.fetch()
      {
        loading: true
      }

  onlinksStateChange: (state) ->
    @setState(@getLinkFromStore())

  onLinkSave: (e)->
    e.preventDefault()
    link =
      url: @state.url
      description: @state.description
      tag_list: @state.tagList?.split(/\s*,\s*/)

    actions.update(@getParams().linkId, link)
    @transitionTo('links')

  render: ->
    <div className='page-editLink'>
      {
        if @state.loading
          <p>loading</p>
        else
          <h1>Share a link!</h1>
          <form onSubmit=@onLinkSave>
            <div className='row input-row'>
              <label className='col-xs-4 col-md-offset-2 col-md-2 text-right url-label'>url:</label>
              <div className='col-xs-8 col-md-6'>
                <input type='text' className='form-control' placeholder='url' valueLink={@linkState('url')} required/>
              </div>
            </div>
            <div className='row input-row'>
              <label className='col-xs-4 col-md-offset-2 col-md-2 text-right'> description:</label>
              <div className='col-xs-8 col-md-6'>
                <textarea type='textarea' rows=2 className='form-control' placeholder='description' valueLink={@linkState('description')} required>
                </textarea>
              </div>
            </div>
            <div className='row input-row'>
              <label className='col-xs-4 col-md-offset-2 col-md-2 text-right'>tags:</label>
              <div className='col-xs-8 col-md-6'>
                <textarea type='textarea' rows=2 className='form-control' placeholder='comma separated tags' valueLink={@linkState('tagList')} />
              </div>
            </div>
            <button type='submit' className='btn btn-primary'>update!</button>
          </form>
      }
    </div>

module.exports = NewLink
