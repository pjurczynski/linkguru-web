React = require 'react'
cx = React.addons.classSet
Router = require('react-router')
Link = Router.Link


Arrow = React.createClass

  getDefaultProps: ->
    disabled: false
    direction: 'left'
    attribute: 'page'
    linkData:
      route: 'tag'
      params: {}
      query: {}
      value: 1

  render: ->
    classes = cx(disabled: @props.disabled)
    <li className={classes}>
      <Link to={@props.linkData.route} params={@props.linkData.params} query={@props.linkData.query}>
        {
          if @props.direction == 'left'
            <span aria-hidden='true'>&laquo;</span>
          else if @props.direction == 'right'
            <span aria-hidden='true'>&raquo;</span>
        }
        <span className="sr-only">Previous</span>
      </Link>
    </li>


module.exports = Arrow
