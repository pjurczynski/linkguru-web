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
    <div className='jumbotron'>
      <h1>Share a link!</h1>
      <form onSubmit=@onLinkAdd>
        <div className='row'>
          <div className='col-xs-12'>
            <input type='text' className='form-control' placeholder='url' valueLink={this.linkState('url')} required/>
          </div>
        </div>
        <div className='row'>
          <div className='col-xs-8'>
            <textarea type='textarea' rows=2 className='form-control' placeholder='description' valueLink={this.linkState('description')} required>
            </textarea>
          </div>
          <div className='col-xs-4'>
            <textarea type='textarea' rows=2 className='form-control' placeholder='comma separated tags' valueLink={this.linkState('tagList')} />
          </div>
        </div>
        <button type='submit' className='btn btn-primary'>share!</button>
      </form>
    </div>

module.exports = NewLink
