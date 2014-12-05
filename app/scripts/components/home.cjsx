React = require 'react'

LinksComponent = require './links'
NewLinkComponent = require './new_link'


Home = React.createClass
  currentLinksPage: ->
    parseInt(@props.query?['links-page']) || 1

  render: ->
    <div className='home-page'>
      {
        if @currentLinksPage() == 1
          <NewLinkComponent/>
      }
      <LinksComponent currentPage={@currentLinksPage()}/>
    </div>

module.exports = Home
