React = require 'react/addons'
Gravatar = require 'react-gravatar'
DateTime = require 'react-time'
cx = React.addons.classSet
RouterLink = require('react-router').Link

actions = Window.Actions.links

Link = React.createClass
  onDownVote: ->
    actions.downVote(@props.link)

  onUpVote: ->
    actions.upVote(@props.link)

  render: ->
    classes = cx(
      'up-voted': @props.link.upVoted
      'down-voted': @props.link.downVoted
    )
    <div className={"row link-component #{classes}"} >
      <div className='score'>
        <div className='row glyphicon glyphicon-chevron-up up-vote' onClick={@onUpVote}></div>
        <div className='row value'>{@props.link.score}</div>
        <div className='row glyphicon glyphicon-chevron-down down-vote' onClick={@onDownVote}></div>
      </div>
      <div className='offset-left-35 offset-right-50'>
        <div className='col-xs-9 link-data'>
          <div className='row url'>
            <a href={@props.link.url}>
              {@props.link.url}
            </a>
          </div>
          <div className='row'>
            {@props.link.description}
          </div>
          <div className='row date'>
            <DateTime value={@props.link.description} relative/>
          </div>
        </div>
        <div className='col-sm-3 tags'>
          {
            @props.link.tags.map (tag) ->
              <button className='btn btn-default btn-xs pull-right'>
                 <RouterLink to="tag" params={name: tag}>{tag}</RouterLink>
              </button>
          }
        </div>
        <div className='visible-sm-inline visible-md-inline visible-lg-inline user'>
          <div className='pull-right'>
            <div className='row'>
              <Gravatar email={@props.link.owner.email} />
            </div>
          </div>
        </div>
      </div>
    </div>


module.exports = Link
