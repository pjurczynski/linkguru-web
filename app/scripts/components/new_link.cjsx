React = require 'react/addons'

cx = React.addons.classSet

actions = Window.Actions.links

NewLink = React.createClass
  mixins: [React.addons.LinkedStateMixin]

  getInitialState: ->
    url: ""
    description: ""
    tags: ""

  onLinkAdd: ->
    link =
      url: @state.url
      description: @state.description
      tags: @state.tags.split(/\s*,\s*/)
      upVoted: true
      downVoted: true
      score: 0
      owner:
        email: 'me@me.com'

    actions.add(link)

  render: ->
    <div className='jumbotron'>
      <h1>Share a link!</h1>
      <div className='row'>
        <div className='col-xs-12'>
          <input type='text' className='form-control' placeholder='url' valueLink={this.linkState('url')} />
        </div>
      </div>
      <div className='row'>
        <div className='col-xs-8'>
          <textarea type='textarea' rows=2 className='form-control' placeholder='description' valueLink={this.linkState('description')} >
          </textarea>
        </div>
        <div className='col-xs-4'>
          <textarea type='textarea' rows=2 className='form-control' placeholder='comma separated tags' valueLink={this.linkState('tags')} />
        </div>
      </div>
      <button className='btn btn-primary' onClick=@onLinkAdd>share!</button>
    </div>


module.exports = NewLink
