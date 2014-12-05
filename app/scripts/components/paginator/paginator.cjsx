_ = require 'underscore'
React = require 'react'
cx = React.addons.classSet
Router = require 'react-router'
Link = Router.Link


Arrow = require './arrow'
Page = require './link'

Paginator = React.createClass
  mixins: [Router.Navigation, Router.CurrentPath, Router.ActiveState]

  getDefaultProps: ->
    visiblePages: 5
    numberOfPages: 10
    currentPage: 1
    attribute: 'page'

  chunks: (array, unit) ->
    result = _.groupBy array, (element, index) ->
      Math.floor index / unit
    _.toArray result

  pagesRange: ->
    console.log  @props.numberOfPages
    if @props.numberOfPages <= 1 then return []
    range = [1..@props.numberOfPages]

    chunks = @chunks(range, @props.visiblePages)
    currentRange = _(chunks).find (chunk) =>
      _(chunk).contains @props.currentPage

    currentRange || []

  prevPageData: ->
    value = @props.currentPage - 1
    prev = if value > 0 then value else 1
    @linkData(prev)

  nextPageData: ->
    value = @props.currentPage + 1
    next = if value <= @props.numberOfPages then value else @props.numberOfPages
    @linkData(next)

  query: (id) ->
    query = Object.create(@getActiveQuery())
    query[@props.attribute] = id
    query

  linkData: (id) ->
    {
      route: @props.route
      params: @getActiveParams()
      query: @query(id)
      value: id
    }

  render: ->
    <div className="text-center">
      {
        if @pagesRange().length > 1
          <ul className="pagination">
            <Arrow key={'left'} disabled={@props.currentPage == 1} direction='left' attribute={@props.attribute} linkData={@prevPageData()}/>
            {
              @pagesRange().map (id) =>
                <Page key={id} active={id == @props.currentPage} attribute={@props.attribute} linkData={@linkData(id)}/>
            }
            <Arrow key={'right'} disabled={@props.currentPage == @props.numberOfPages} direction='right' attribute={@props.attribute} linkData={@nextPageData()}/>
          </ul>
      }
    </div>
module.exports = Paginator
