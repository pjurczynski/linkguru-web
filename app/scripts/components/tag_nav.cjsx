React = require 'react/addons'
Router = require('react-router')
Link = Router.Link
cx = React.addons.classSet


TagNav = React.createClass
  render: ->
    classes = cx(
      'active': @props.tag.selected
    )
    <li className="tag-nav #{classes}">
      <Link to="tag" params={@props.tag}>{@props.tag.name}</Link>
    </li>

module.exports = TagNav
