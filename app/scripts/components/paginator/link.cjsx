React = require 'react'
cx = React.addons.classSet
Router = require('react-router')
Link = Router.Link


PaginationLink = React.createClass
  mixins: [Router.ActiveState]

  getDefaultProps: ->
    active: false
    attribute: 'page'
    linkData:
      route: 'tag'
      params: {}
      query: {}
      value: 1

  render: ->
    classes = cx(active: @props.active)
    <li className={classes}>
      <Link to={@props.linkData.route} params={@props.linkData.params} query={@props.linkData.query}>{@props.linkData.value}</Link>
    </li>


module.exports = PaginationLink
