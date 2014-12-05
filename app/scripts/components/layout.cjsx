React = require 'react'

NavbarComponent = require './navbar'


Layout = React.createClass
  render: ->
    <div className='App'>
      <div className='header'>
        <NavbarComponent/>
      </div>
      <div className='container page-container'>
        <this.props.activeRouteHandler/>
      </div>
    </div>

module.exports = Layout
