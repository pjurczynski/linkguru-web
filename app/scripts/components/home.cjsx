React = require 'react'
Router = require 'react-router'

LinksComponent = require './links'
NewLinkComponent = require './new_link'


Home = React.createClass
  mixins: [Router.State]

  currentLinksPage: ->
    parseInt(@getQuery()?['links-page']) || 1

  render: ->
    <div className='home-page'>
      {
        if @currentLinksPage() == 1
          <NewLinkComponent/>
      }
      <LinksComponent currentPage={@currentLinksPage()}/>
    </div>

module.exports = Home
