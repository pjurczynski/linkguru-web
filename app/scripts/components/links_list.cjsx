React = require 'react/addons'
_ = require 'underscore'

LinkComponent = require './link'
Paginator = require('./paginator/paginator')


LinksList = React.createClass
  mixins: [React.addons.LinkedStateMixin]

  getDefaultProps: ->
    currentPage: 1
    listName: 'links'
    perPage: 20

  getInitialState: ->
    visiblePages: 5

  numberOfPages: ->
    Math.ceil _(@getLinks()).size() / @props.perPage

  currentLinks: ->
    from = (@props.currentPage - 1) * @props.perPage
    to = @props.currentPage * @props.perPage
    @getLinks().slice(from, to) || []

  getLinks: ->
    @state.searchResults || _(@props.links).toArray()

  render: ->
    <div className='links-list-component'>
      <div className='list'>
        {
          @currentLinks().map (link, id) ->
            <LinkComponent key={id} link={link}/>
        }
      </div>
      <div className='links-pagination'>
        <Paginator currentPage={@props.currentPage} route={@props.route} attribute="#{@props.listName}-page" visiblePages={@state.visiblePages} numberOfPages={@numberOfPages()}/>
      </div>
    </div>

module.exports = LinksList
