React = require 'react'
RouteHandler = require('react-router').RouteHandler

NavbarComponent = require './navbar'


Layout = React.createClass
  render: ->
    <div className='App'>
      <div className='header'>
        <NavbarComponent/>
      </div>
      <div className='container page-container'>
        <RouteHandler />
      </div>
    </div>

module.exports = Layout
