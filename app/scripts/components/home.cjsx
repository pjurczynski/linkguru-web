React = require 'react'

LinksComponent = require './links'
NewLinkComponent = require './new_link'


Home = React.createClass
  render: ->
      <div className='home-page'>
        <NewLinkComponent/>
        <LinksComponent/>
      </div>

module.exports = Home
