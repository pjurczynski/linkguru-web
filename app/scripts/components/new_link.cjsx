React = require 'react/addons'
cx = React.addons.classSet

actions = window.Actions.links

Authentication = require './../mixins/authentication'
NewLink = React.createClass
  mixins: [React.addons.LinkedStateMixin, Authentication]

  getInitialState: ->
    url: ""
    description: ""
    tagList: ""

  onLinkAdd: (e)->
    e.preventDefault()
    link =
      url: @state.url
      description: @state.description
      tag_list: @state.tagList.split(/\s*,\s*/)
      upVoted: true
      downVoted: true
      score: 0
      owner:
        email: 'me@me.com'

    @setState(@getInitialState())

    actions.add(link)

  render: ->
    <div className='row editLink'>
      <h1 className='text-center'>Share a link!</h1>
      <form onSubmit=@onLinkAdd>
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
        <div className='row actions'>
          <button type='submit' className='btn btn-primary col-md-4 col-md-offset-4'>share!</button>
        </div>
      </form>
    </div>

module.exports = NewLink
