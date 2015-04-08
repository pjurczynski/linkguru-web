React = require 'react/addons'
_ = require 'underscore'
Router = require 'react-router'

LinkComponent = require './link'
Paginator = require('./paginator/paginator')


LinksList = React.createClass
  mixins: [React.addons.LinkedStateMixin, Router.State]

  getDefaultProps: ->
    currentPage: 1
    listName: 'links'
    perPage: 20

  getInitialState: ->
    visiblePages: 5

  numberOfPages: ->
    Math.ceil _(@getLinks()).size() / @props.perPage

  currentLinksPage: ->
    parseInt(@getQuery()?['links-page']) || 1

  currentLinks: ->
    from = (@currentLinksPage() - 1) * @props.perPage
    to = @currentLinksPage() * @props.perPage
    @getLinks().slice(from, to) || []

  getLinks: ->
    @state.searchResults || _(@props.links).toArray()

  componentDidMount: ->
    window.Actions.links.fetch()

  render: ->
    <div className='links-list-component'>
      <div className='list'>
        {
          @currentLinks().map (link, id) ->
            <LinkComponent key={id} link={link}/>
        }
      </div>
      <div className='links-pagination'>
        <Paginator currentPage={@currentLinksPage()} route={@props.route || 'links'} attribute="#{@props.listName}-page" visiblePages={@state.visiblePages} numberOfPages={@numberOfPages()}/>
      </div>
    </div>

module.exports = LinksList
