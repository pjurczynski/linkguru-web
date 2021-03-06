React = require 'react/addons'
Gravatar = require 'react-gravatar'
DateTime = require 'react-time'
cx = React.addons.classSet
RouterLink = require('react-router').Link

actions = window.Actions.links


Link = React.createClass
  onDownVote: ->
    actions.downVote(@props.link)

  onUpVote: ->
    actions.upVote(@props.link)

  linkUrl: ->
    @props.link.url

  render: ->
    classes = cx(
      'up-voted': @props.link.upVoted
      'down-voted': @props.link.downVoted
    )
    <div className={"row link-component #{classes}"}>
      <div className='score'>
        <div className='row'>
          <div className='btn bt-link up-vote' onClick={@onUpVote}>&#9650;</div>
        </div>
        <div className='row value'>
          {@props.link.score}
        </div>
        <div className='row'>
          <div className='btn bt-link down-vote' onClick={@onDownVote}>&#9660;</div>
        </div>
      </div>
      <div className='offset-left-35 offset-right-50'>
        <div className='col-xs-9 link-data'>
          <div className='row url'>
            <a href={@linkUrl()}>
              {@props.link.url}
            </a>
            {
              if @props.link.owned
                <span className='btn btn-default btn-xs edit'>
                  <RouterLink to="editLink" params={linkId: @props.link.id}>
                    edit
                  </RouterLink>
                </span>
            }
          </div>
          <div className='row'>
            {@props.link.description}
          </div>
          <div className='row date'>
            <DateTime value={@props.link.created_at} relative/>
          </div>
        </div>
        <div className='col-sm-3 tags'>
          {
            @props.link.tag_list.map (tag) ->
              <button className='btn btn-default btn-xs pull-right'>{tag}</button>
          }
        </div>
      </div>
      <div className='visible-sm-inline visible-md-inline visible-lg-inline user'>
        <div className='pull-right'>
          <div className='row'>
            <Gravatar email={@props.link.user.email} />
          </div>
        </div>
      </div>
    </div>


module.exports = Link
