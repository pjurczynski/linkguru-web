React = require 'react'
Router = require 'react-router'
Authentication = require './../mixins/authentication'

LinksComponent = require './links'
NewLinkComponent = require './new_link'

Home = React.createClass
  mixins: [Router.State, Authentication]

  currentLinksPage: ->
    parseInt(@getQuery()?['links-page']) || 1

  render: ->
    <div className='home-page'>
      {
        if @currentLinksPage() == 1
          <NewLinkComponent/>
      }
      <hr/>
      <LinksComponent currentPage={@currentLinksPage()} route='/'/>
    </div>

module.exports = Home
